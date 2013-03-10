require 'spec_helper'
require 'cosmicrawler'

describe Cosmicrawler do
  before :each do
    WebMock.reset!
      stub_request(:get, /.+/).to_return(:status => 200, :body => "", :headers => {})
  end

  describe :each do
    it 'block is required' do
      lambda {Cosmicrawler.each(%w())}.should raise_error
    end
    
    context %w() do
      it 'block is not called' do
        Cosmicrawler.each(%w()) {|item|
          request = EM::HttpRequest.new('http://example.com/')
          request.get
        }
        WebMock.should_not have_requested(:get, "http://example.com/")
      end
    end    
    
    context %w(http://example.com/1) do
      it 'block is called once' do
        Cosmicrawler.each(%w(http://example.com/1)) {|item|
          request = EM::HttpRequest.new(item)
          request.get
        
        }
        WebMock.should have_requested(:get, "http://example.com/1")
      end
    end
    
    context %w(http://example.com/1 http://example.com/2) do
      it 'block is called twice' do
        Cosmicrawler.each(%w(http://example.com/1 http://example.com/2)) {|item|
          request = EM::HttpRequest.new(item)
          request.get
        }      
        WebMock.should have_requested(:get, "http://example.com/1")
        WebMock.should have_requested(:get, "http://example.com/2")
      end
    end
  end
  
  describe :http_crawl do
    it 'block is required' do
      lambda {Cosmicrawler.http_crawl(%w())}.should raise_error
    end

    context %w() do
      it 'block is not called' do
        Cosmicrawler.http_crawl(%w()) {|request|
          EM::HttpRequest.new('http://example.com/').get
        }
        WebMock.should_not have_requested(:get, "http://example.com/")
      end
    end    
    
    context %w(http://example.com/1) do
      it 'block is called once' do
        Cosmicrawler.http_crawl(%w(http://example.com/1)) {|request|
          request.get
        
        }
        WebMock.should have_requested(:get, "http://example.com/1")
      end
    end
    
    context %w(http://example.com/1 http://example.com/2) do
      it 'block is called twice' do
        Cosmicrawler.http_crawl(%w(http://example.com/1 http://example.com/2)) {|request|
          request.get
        }      
        WebMock.should have_requested(:get, "http://example.com/1")
        WebMock.should have_requested(:get, "http://example.com/2")
      end
    end

    context 'URI' do
      it do
        urls = %w(http://example.com/1 http://example.com/2).map {|str| URI.parse str}
        
        Cosmicrawler.http_crawl(urls) {|request|
          request.get
        }      
        WebMock.should have_requested(:get, "http://example.com/1")
        WebMock.should have_requested(:get, "http://example.com/2")
      end
    end
  end  
end
