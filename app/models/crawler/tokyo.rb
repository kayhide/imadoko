# -*- coding: utf-8 -*-
module Crawler
  class Tokyo < Base
    def url
      "http://p.tokyo42195.org/numberfile/#{@entry.number}.html"
    end

    def crawl
    end

    def fetch
      doc = nil
      open(self.url) do |data|
        doc = Nokogiri::HTML(data)
      end

      # index  |         <dt>           |       <dd>
      # -------+------------------------+-----------------
      #   0    |   ナンバー(Bib number) |  99999999
      #   1    |   氏名(Name)           |  苗字&nbsp;名前
      #   2    |   種目(Category)       |  マラソン男子

      unless doc.css('#frame dd').map(&:text).first == @entry.number
        raise 'bib number mismatched.'
      end

      # th[1]        th[2]                      th[3]     th[4]
      #----------------------------------------------------------
      # 地点名  スプリット （ネットタイム）   ラップ    通過時間
      # Point     Split    （Net Time）         Lap       Time

      # td[1]        td[2]                      td[3]     td[4]
      #----------------------------------------------------------
      # 5km     00:20:40　(0:20:20)           0:20:20   09:30:40
      # 10km    00:41:10　(0:40:50)           0:20:30   09:51:10
      # 15km    01:01:49　(1:01:29)           0:20:39   10:11:49
      # 20km    01:22:40　(1:22:20)           0:20:51   10:32:40
      # 25km    01:43:13　(1:42:53)           0:20:33   10:53:13
      # 30km    02:03:59　(2:03:39)           0:20:46   11:13:59
      # 35km    02:24:58　(2:24:38)           0:20:59   11:34:58
      # 40km    02:46:42　(2:46:22)           0:21:44   11:56:42
      # Finish  02:56:21　(2:56:01)           0:09:39   12:06:21

      doc.search("//table[@class='sarchList']//tr[position()>1]").map do |tr|
        {
          point: tr.search("td[1]").text,  #=> 5km
          split: tr.search("td[2]").text,  #=> 00:20:40　(0:20:20)
          lap:   tr.search("td[3]").text,  #=> 0:20:20
          time:  tr.search("td[4]").text,  #=> 09:30:40
        }
      end
    end

    # 現在位置、ゴール時刻を予測する
    def calc_expectancy hash
      now_time = Time.now
      passed_time = Time.parse(hash[:time ])

      reg = Regexp.new("[0-9]*km", Regexp::IGNORECASE)

      if reg.match(hash[:point]) && hash[:point].to_i % 5 == 0

        progress_sec = now_time.to_i - passed_time.to_i # 最終地点を通過してからの経過時間
        lap_time = Time.parse(hash[:lap])                                  # ラップタイム
        lap_sec  = lap_time.hour * 3600 + lap_time.min * 60 + lap_time.sec # ラップタイム(秒）
        speed_per_second = 5000.0 / lap_sec.to_f        # 秒速

        hash[:now_point] = progress_sec * speed_per_second / 1000.0 + hash[:point].to_i # 現在位置(Km)

        /([0-9:]+)　*([0-9:]+)/ =~ hash[:split].gsub(/[()]/, '')
        gross_time = Time.parse(Regexp.last_match(1))   # スプリット グロス
        net_time = Time.parse(Regexp.last_match(2))     # スプリット ネット

        required_time = (42.195 - hash[:point].to_i.to_f ) * (lap_sec / 5.0) # ゴールまでに必要な時間

        hash[:gross_expectancy] = gross_time + required_time # ゴール予測（グロス）
        hash[:net_expectancy  ] = net_time   + required_time # ゴール予測（ネット）

      else
        hash[:now_point       ] = nil
        hash[:gross_expectancy] = nil
        hash[:net_expectancy  ] = nil
      end
    end
  end
end
