require'eventmachine'
require'em-synchrony'
require "em-synchrony/fiber_iterator"

require 'ostruct'

require_relative 'em/crawler.rb'
require_relative 'em/http_crawler.rb'

module Cosmicrawler
  module Em
    def initialize concurrency
      @concurrency = concurrency
    end

    private
    def iterate collection, &block
      EventMachine.synchrony do
        EM::Synchrony::FiberIterator.new(collection, @concurrency).each do |item|
          block.call item
        end
        EM.stop_event_loop
      end #EventMachine.synchrony
      self
    end #iterate
  end
end