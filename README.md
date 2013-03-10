# Cosmicrawler

Cosmicrawler is crawler library for Ruby. It provides scalable asynchronous crawling by http, file, etc using [EventMachine](https://github.com/eventmachine/eventmachine).

## Installation

Add this line to your application's Gemfile:

    gem 'cosmicrawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cosmicrawler

## Usage

### http

````ruby
require 'cosmicrawler'

Cosmicrawler.http_crawl(%w(http://example.com/1 http://example.com/2)) {|request|
  get = request.get
  puts get.response if get.response_header.status == 200
}
```` 

````ruby
require 'cosmicrawler'
require'em-http-request'

Cosmicrawler.each(%w(http://example.com/1 http://example.com/2)) {|item|
  request = EM::HttpRequest.new(item)
  get = request.get
  puts get.response if get.response_header.status == 200
}      

```` 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
