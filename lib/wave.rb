module Wave
  VERSION = File.read(File.dirname(__FILE__) + "/../VERSION").chomp
end


# $:.unshift File.dirname(__FILE__)

p $:

require "wave/robot"
