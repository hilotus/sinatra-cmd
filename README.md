# Sinatra::Cmd

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-cmd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-cmd

## Usage

```ruby
# app_name format could be:
#   1. aaa_bbb_ccc
#   2. aaa-bbb-ccc
#   3. aaa

sinatra {app_name}
```

##How to use pry (option, latest version is unnecessary)

create .pryrc file in `/Users/username` or `/home/username` folder.

```shell
#!/usr/bin/ruby

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sinatra-cmd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
