require 'spec_helper'

describe Crawler::Base do
  describe '#entry' do
    before do
      @race = FactoryGirl.create(:race)
      @entry = FactoryGirl.create(:entry, race: @race, number: '1234')
      @crawler = Crawler::Tokyo.new
      @crawler.entry = @entry
    end

    it 'returns @entry' do
      @crawler.entry.should == @entry
    end
  end

  describe '#crawl' do
    before do
      @crawler = Crawler::Base.new
    end

    it 'raises' do
      expect {
        @crawler.crawl
      }.to raise_error
    end
  end
end
