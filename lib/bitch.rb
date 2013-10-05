require "bitch/version"

module Bitch
  def self.silence!
    @silenced = true
  end
  
  def self.yell(options)
    if options.is_a? String
      args = "-message \"#{options}\""
    else
      options.each do |arg, val|
        val.capitalize! if arg == :sound
        (args ||= "") << "-#{arg} \"#{val}\" "
      end
      
      args.strip!
    end
    
    @silenced ? false : `terminal-notifier #{args}`
  end
end