require File.dirname(__FILE__) + '/test_helper'

class RobotTest < Test::Unit::TestCase

  context "defining a robot" do
    context "with no name" do
      should "raise error" do
        assert_raises(Wave::Robot::Error) { Wave::Robot.define '' }
      end
    end
    context "with no options" do
      should "raise error" do
        assert_raises(Wave::Robot::Error) { Wave::Robot.define('PoorlyDefined') }
      end
    end
    context "with name and options" do
      setup {
        @robot = Wave::Robot.define("ValidName", :image_url => '/img.jpg',
                                           :profile_url => '/profile.html')
      }
      should "return a robot instance" do
        assert_kind_of Wave::Robot, @robot
      end
      should "set the name on the robot" do
        assert_equal 'ValidName', @robot.name
      end
      should "set the options on the robot" do
        assert_equal '/img.jpg', @robot.options[:image_url]
        assert_equal '/profile.html', @robot.options[:profile_url]
      end
    end
  end

  context "Robot events" do
    context "specified via .define block" do
      setup {
          @robot = Wave::Robot.define "ValidName",
                                      :image_url => '/img.jpg',
                                      :profile_url => '/prof.html' do
            wavelet_blip_created do |content|
              "create a new blip"
            end
          end
      }
      should "save the specified events into an event callback" do
        assert_equal 1, @robot.events[:wavelet_blip_created].size
      end
      should "have no callbacks for events that weren't supplied" do
        assert_equal 0, @robot.events[:document_changed].size
      end
    end
  end
end

