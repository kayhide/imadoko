require 'spec_helper'

describe Entry do
  describe '#crawl' do
    before do
      @entry = FactoryGirl.create(:entry, :with_race)
    end

    it 'calls Race#create_crawler' do
      crawler = double(Crawler::Base, crawl: '')
      expect(@entry.race).to receive(:create_crawler).with(@entry).and_return(crawler)
      @entry.crawl
    end
  end
end
