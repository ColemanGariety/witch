require "bitch/version"

module Bitch
  def self.silence!
    @silenced = true
  end
  
  def self.yell(options)
    if options.is_a? Hash
      options.each do |arg, val|
        val.capitalize! if arg == :sound
        (args ||= "") << "-#{arg} \"#{val.to_s}\" "
      end
      
      args.strip!
    else
      args = "-message \"#{options.to_s}\""
    end
    
    @silenced ? false : `terminal-notifier #{args}`
  end
end
