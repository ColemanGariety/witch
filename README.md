# Bitch

A logger for Ruby that uses OS X notifications.

![bitch](https://raw.github.com/JacksonGariety/bitch/master/bitch.jpg)

*Gets in yo face when you write ruby.*

## Installation

Add this line to your application's Gemfile under the `:development` tree:

    gem 'bitch'

And then execute:

    $ bundle

## Usage

Some examples of how to use your bitch:

1. `Bitch.yell("yo homie there's a problem") #=> true`
2. `Bitch.yell(message: "yo homie there's a problem", sound: "Frog") #=> true`
3. `Bitch.silence!; Bitch.yell("yo homie there's a problem") #=> false`

Example #2 takes options based on the [terminal-notifier](https://github.com/alloy/terminal-notifier) documentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
