module Crawler
  class Base
    attr_accessor :entry

    def crawl
      raise 'not implemented.'
    end
  end
end
