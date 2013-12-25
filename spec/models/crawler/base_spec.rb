require 'spec_helper'

describe Crawler::Base do
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
