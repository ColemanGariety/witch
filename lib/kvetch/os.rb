require 'rbconfig'

# An alternative would be using `RUBY_PLATFORM`.
# That would not require `rbconfig` but would
# fail on JRuby (returning `java` independently of
# the running OS).

# Finds out the current Operating System.
module OS
  def self.windows?
    windows = /cygwin|mswin|mingw|bccwin|wince|emx/i

    (RbConfig::CONFIG['host_os'] =~ windows) != nil
  end

  def self.mac?
    mac = /darwin|mac os/i

    (RbConfig::CONFIG['host_os'] =~ mac) != nil
  end

  def self.unix?
    unix = /solaris|bsd/i

    (RbConfig::CONFIG['host_os'] =~ unix) != nil
  end

  def self.linux?
    linux = /linux/i

    (RbConfig::CONFIG['host_os'] =~ linux) != nil
  end
end

