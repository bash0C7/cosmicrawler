module Cosmicrawler
  %w(version em).each do |lib|
    require_relative 'cosmicrawler/' + lib
  end

  DEFAULT_CONCURRENCY = 8
  
  class << self
    def each collection, concurrency = DEFAULT_CONCURRENCY, &block
      c = Em::Crawler.new concurrency
      c.each collection, &block
    end

    def http_crawl urls, concurrency = DEFAULT_CONCURRENCY, &block
      c = Em::HttpCrawler.new concurrency
      c.crawl urls, &block
    end
  end
end
