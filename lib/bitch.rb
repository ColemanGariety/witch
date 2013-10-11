require "bitch/version"
require "bitch/os"

module Bitch

  # toggle silentness
  def self.silence!
    if @silenced
      @silenced = !@silenced
    else
      @silenced = true
    end
  end

  def self.silent?
    @silenced
  end

  def self.yell(options)
    return false if @silenced

    if OS.mac?
      if options.is_a? Hash
        options.each do |arg, val|
        val.capitalize! if arg == :sound
        (args ||= "") << "-#{arg} \"#{val.to_s}\" "
      end

        args.strip!
      else
        args = "-message \"#{options.to_s}\""
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
