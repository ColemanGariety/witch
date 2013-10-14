# Kvetch
[![Gem Version](https://badge.fury.io/rb/kvetch.png)](http://badge.fury.io/rb/kvetch)

A Ruby logger that uses native Mac/Linux notifications.

![kvetch](https://raw.github.com/JacksonGariety/kvetch/master/kvetch.jpg)

*Gets in yo face when you write ruby.*

## Installation

Add this line to your application's Gemfile under the `:development` tree:

    gem 'kvetch'

And then execute:

    $ bundle

## Usage

Some examples of how to use kvetch:

1. `Kvetch.yell("yo homie there's a problem") #=> String`
2. `Kvetch.yell("yo homie there's a problem", { :sound => "Frog" }) #=> String`
3. `Kvetch.silence!; Kvetch.yell("yo homie there's a problem") #=> false`
4. `Kvetch.silence!; Kvetch.unsilence!; Kvetch.yell("stop that") #=> String`

`Kvetch.yell`'s second parameter is a hash of symbols/values based on the [terminal-notifier](https://github.com/alloy/terminal-notifier) documentation.

## Contributing

#### Cloning

This repo depends upon my fork of @alloy's `terminal-notifier` gem. To clone with submodules:

    $ git clone --recursive https://github.com/JacksonGariety/terminal-notifier.git

#### GitHub for dummies

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
