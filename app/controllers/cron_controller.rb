class CronController < ApplicationController
  def crawl
    @entries = Entry.running
    @entries.each do |entry|
      entry.delay.crawl
    end
    render text: 'ok'
  end
end
