require File.dirname(__FILE__) + '/test_helper'

class WaveTest < Test::Unit::TestCase

  context "instantiating a wave" do
    context "without any id" do
      should "raise an error" do
        assert_raises(ArgumentError) { @wave = Wave.new }
      end
    end
    context "without a valid id" do
      should "raise an error" do
        assert_raises(Wave::WaveError) { @wave = Wave.new('') }
      end
    end
  end
end

