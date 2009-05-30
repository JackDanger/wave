#
# Wave Robot
#
# A wave robot is created by giving the robot a name
# and a set of options and then definining callbacks
# for the various operations it might receive from the
# wave server.
# 
# For example:
#     Robot.define "Terminator",
#                  :image_url => 'http://www.sky.net/models/t800.png',
#                  :profile_url => 'http://www.sky.net/models/t800.html'
#                  do |robot|
#       robot.wavelet_participants_changed do |wavelet|
#         wavelet.kill_participant
#       end
#     end
# 
# Required options:
#     image_url: the location of the avatar graphic to identify the robot
#     profile_url: the URI of the html description of the robot.
# Available options:
#     debug: Optional variable that defaults to False and is passed through
#         to the webapp application to determine if it should show debug info.
#

require "wave/events"

class Wave
  class Robot

    class Error < StandardError; end

    include Wave::Events

    def self.define(name, options = {})
      if block_given?
        yield new(name, options)
      else
        new(name, options)
      end
    end

    attr_reader :name, :options

    def initialize(name, options = {})
      raise Error, "Each Robot requires a name" if name.empty?
      raise Error, "Each Robot requires an image_url" unless options[:image_url]
      raise Error, "Each Robot requires a profile_url" unless options[:profile_url]
      @name = name
      @options = options
    end
  end
end