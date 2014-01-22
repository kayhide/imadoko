# -*- coding: utf-8 -*-
require 'spec_helper'

describe Crawler::Tokyo do
  before do
    @crawler = Crawler::Tokyo.new
    @crawler.entry = FactoryGirl.create(:entry, :with_race, number: '10617')
  end

  describe '#url' do
    it 'returns url' do
      @crawler.url.should == 'http://p.tokyo42195.org/numberfile/10617.html'
    end
  end

  describe '#crawl' do
  end

  describe '#fetch' do
    before do
      stub_request(:get, @crawler.url).
        to_return(headers: {'Content-Type' => 'text/html'}, body: <<EOS)
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div id="frame">
<dl class="taikaiDtl">
<dt>ナンバー(Bib number)：</dt>
<dd>10617</dd>
</dl><br>
<dl class="taikaiDtl">
<dt>氏名(Name)：</dt>
<dd>山下&nbsp;直希</dd>
</dl><br>
<dl class="taikaiDtl">
<dt>種目(Category)：</dt>
<dd>マラソン男子</dd>
</dl>
</div>
<table class="sarchList">
<tbody><tr>
<th id="list01">地点名<br>Point</th>
<th id="list02">スプリット （ネットタイム）<br>Split （Net Time）</th>
<th id="list03">ラップ<br>Lap</th>
<th id="list04">通過時間<br>Time</th>
</tr>
<tr>
<td>5km</td>
<td>00:20:40　(0:20:20)</td>
<td>0:20:20</td>
<td>09:30:40</td>
</tr>
<tr>
<td>10km</td>
<td>00:41:10　(0:40:50)</td>
<td>0:20:30</td>
<td>09:51:10</td>
</tr>
</tbody></table>
</body>
</html>
EOS
    end

    describe 'with entry with wrong number' do
      before do
        @crawler.entry.number = '9999'
      end

      it 'raises error' do
        expect {
          @crawler.fetch
        }.to raise_error
      end
    end

    it 'returns array of hash' do
      @crawler.fetch.should == [
        {point: '5km', split: '00:20:40　(0:20:20)', lap: '0:20:20', time: '09:30:40'},
        {point: '10km', split: '00:41:10　(0:40:50)', lap: '0:20:30', time: '09:51:10'},
      ]
    end
  end
end
