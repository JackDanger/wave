# Wave
#
#  A wave is identified by a globally unique wave id, which is
#  a pair of a domain name and an id string. The domain names
#  the wave provider where the wave originated.
#  So if you're accessing a wave initiated by wave.google.com
#  the Wave id may look like the following:
#
#    a12f4d@wave.google.com
#
#  A wave contains a collection of wavelets which each have a distinct
#  list of participants and a historical set of operations (blips)
#  which contain documents


class Wave
  VERSION = File.read(File.dirname(__FILE__) + "/../VERSION").chomp

  class WaveError < StandardError; end


  attr_reader :id, :wavelets, :options

  def initialize(id, options = {})
    @id = id
    @options = options
    @wavelets = []
  end
end


$:.unshift File.dirname(__FILE__)

require "wave/wavelet"
require "wave/participant"
require "wave/blip"
require "wave/robot"
