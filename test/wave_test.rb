require File.dirname(__FILE__) + '/test_helper'

class WaveTest < Test::Unit::TestCase

  context "instantiating a wave" do
    context "without any id" do
      should "raise an error" do
        assert_raises(ArgumentError) { @wave = Wave.new }
      end
    end
    should "set the wave id" do
      assert Factory.wave.id =~
                /^[\w\d]+@[\w\d]+\.[\w\d]+/
    end
  end
end

