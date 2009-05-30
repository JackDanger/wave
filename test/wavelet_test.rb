require File.dirname(__FILE__) + '/test_helper'

class WaveletTest < Test::Unit::TestCase

  context "a wavelet" do
    setup { @wavelet = Factory.wavelet }
    should "have a wave" do
      assert @wavelet.wave
    end
    should "require a wave" do
      assert_raises Wave::WaveError do
        Wave::Wavelet.new
      end
    end
    should "have a participant list" do
      assert @wavelet.participants
    end
    should "have a collection of blips" do
      assert @wavelet.blips
    end
    should "register itself in it's wave's wavelet collection" do
      assert @wavelet.wave.wavelets.include?(@wavelet)
    end
  end
end
