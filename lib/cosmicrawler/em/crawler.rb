module Cosmicrawler
  module Em
    class Crawler
      include Em

      def each collection, &block
        raise unless block_given?
      
        iterate(collection) do |item|
          block.call item
        end
      
        self
      end
    end
  end
end
