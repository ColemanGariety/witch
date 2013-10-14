require 'kvetch/version'
require 'kvetch/os'
require 'shellwords'

module Kvetch
  # Main usage: Kvetch.yell(MESSAGE)
  def self.yell(message, options = {})
    return false if @silenced

    if message.is_a? String
      if OS.mac? && `sw_vers -productVersion` >= '10.8'
        bin = File.expand_path('../../vendor/terminal-notifier/kvetch.app/Contents/MacOS/terminal-notifier', __FILE__)
        
        options[:sound].capitalize! if options[:sound]
        options = options.merge(:message => message).map do |argument, value|
          value = value.to_s; ["-#{argument}", "#{Shellwords.escape(value[0,1])}#{value[1..-1]}"]
        end

        command = [bin, *options.flatten]
        command = Shellwords.join(command) if RUBY_VERSION < '1.9'

        IO.popen(command) # send message and options to terminal-notifier/kvetch.app
      elsif OS.linux? || OS.unix?
        `notify-send \"#{message}\"`
      else # OS doesn't have notification support
        return "Kvetch works on Linux, Unix, or Mac OS X >= 10.8."
      end
    else # message is not a string
      return "You should give that kvetch a string. Kvetches love strings."
    end
  end

  # Silence methods
  def self.silence!() @silenced = true end
  def self.unsilence!() @silenced = false end
  def self.silent?() @silenced end
end
