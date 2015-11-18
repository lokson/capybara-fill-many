# Fill Many, helper for Capybara tests

In Capybara it's common to fill a form:

```ruby
fill_in :user_email, with: attributes[:email]
fill_in :user_password, with: attributes[:password]
fill_in :user_password_confirmation, with: attributes[:password_confirmation]
```

With this helper function, series of `fill_in` becomes `fill_many`: 

```ruby
fill_many :user, with: attributes 
```

In above examples, attributes are a hash. Active record can be used too, and in that case `with` option can be skipped, as input names will be set using standard Rails rules.

```ruby
fill_many with: user
```
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capybara-fill-many'
```

Execute:

    $ bundle

And add two lines to test_helper.rb

```ruby
require 'capybara/fill_many'
...

class ActiveSupport::TestCase
  ...
  include Capybara::FillMany
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lokson/capybara-fill-many. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

