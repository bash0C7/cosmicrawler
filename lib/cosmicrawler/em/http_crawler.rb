require'em-http-request'
require'em-synchrony/em-http'

module Cosmicrawler
  module Em
    class HttpCrawler
      include Em
    
      def crawl urls, &block
        raise unless block_given?

        iterate(urls) do |url|
          request = ::EM::HttpRequest.new(url)
          block.call request
        end

      end
    end
  end
end