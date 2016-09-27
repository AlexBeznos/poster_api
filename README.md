# PosterApi

PosterApi is a wrapper for cloud HoReCa automatization ["Poster"](https://joinposter.com).

## Installation

```ruby
gem 'poster_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install poster_api

## Usage

#### Client

Client is used to make requests to poster.

```ruby
access_token    = "745d516e1b9320ed85b84d5bfda14148"
account         = "demo"
response_format = "json"
poster_method   = "dash.getAnalytics"
params          = { id: 2, type: "product" }

client = PosterApi::Client.new(access_token, account, response_format) # account and response_format can be defined in configuration
res    = client.get(poster_method, params) # instead of get can be post
res.status # response status
res.body # response body
```

#### Configuration

Depending on your needs you may predefine some variables to not put it implicitely during gem usage.

```ruby
PosterApi.configure do |config|
  config.response_format = 'json'
  config.client_id = 'client_id'
  config.client_secret = 'client_secret'
  config.account = 'account'
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AlexBeznos/poster_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
