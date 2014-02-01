require 'spec_helper'

describe Race do
  class Crawler::Double < Crawler::Base
    def crawl
    end
  end

  describe '#create_crawler' do
    before do
      @race = FactoryGirl.create(:race)
      @race.crawler = 'Crawler::Double'
    end

    it 'returns crawler' do
      entry = FactoryGirl.create(:entry, race: @race)
      expect(@race.create_crawler(entry)).to be_instance_of(Crawler::Double)
    end

    it 'returns crawler with given entry' do
      entry = FactoryGirl.create(:entry, race: @race)
      expect(@race.create_crawler(entry).entry).to eq entry
    end
  end
end
