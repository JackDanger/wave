require File.dirname(__FILE__) + '/test_helper'

class ParticipantTest < Test::Unit::TestCase

  context "a participant" do
    setup { @blip = Factory.participant }
    should "have a wavelet" do
      assert @blip.wavelet
    end
    should "have an id" do
      assert @blip.id
    end
    should "require an id" do
      assert_raises Wave::WaveError do
        Wave::Participant.new(:wavelet => Factory.wavelet)
      end
    end
    should "require a wavelet" do
      assert_raises Wave::WaveError do
        Wave::Participant.new(:id => 'user@email.com')
      end
    end
  end
end
