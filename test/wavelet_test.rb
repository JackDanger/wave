require File.dirname(__FILE__) + '/test_helper'

class WaveletTest < Test::Unit::TestCase

  context "a wavelet" do
    setup { @wavelet = Wave::Wavelet.new(:wave => new_wave) }
    should "have a wave" do
      assert @wavelet.wave
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

  protected

    def new_wave
      Wave.new("someid@wave.google.com")
    end

end
