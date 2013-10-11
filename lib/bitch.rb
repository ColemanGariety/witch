require "bitch/version"
require "bitch/os"

module Bitch
  def self.silence!
    @silenced = true
  end

  def self.yell(options)
    return false if @silenced

    if OS.mac?
      if options.is_a? String
        args = "-message \"#{options}\""
      else
        options.each do |arg, val|
          val.capitalize! if arg == :sound
          (args ||= "") << "-#{arg} \"#{val}\" "
        end

        args.strip!
      end

      `terminal-notifier #{args}`
    elsif OS.linux? or OS.unix?
      if options.is_a? String
        args = "\"#{options}\""
      else
        return false
      end

      `notify-send #{args}`
    else
      return false
    end
  end
end
