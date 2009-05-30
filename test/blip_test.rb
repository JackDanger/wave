require File.dirname(__FILE__) + '/test_helper'

class BlipTest < Test::Unit::TestCase

  context "a blip" do
    setup { @blip = new_blip }
    should "have a wavelet" do
      assert @blip.wavelet
    end
    should "have a wave" do
      assert @blip.wave
    end
    should "have a creator" do
      assert @blip.creator
    end
    should "have a collection of child blips" do
      assert @blip.children
    end
    should "be root if it's the first blip in the wavelet" do
      assert @blip.root?
    end
    should "not have a parent if it's the root blip" do
      assert !@blip.parent
    end
    should "register itself in it's wavelet's blip collection" do
      assert @blip.wavelet.blips.include?(@blip)
    end
    context "made second" do
      setup { @second_blip = new_blip(:wavelet => @blip.wavelet) }
      should "not be root" do
        assert !@second_blip.root?
      end
    end
    context "made as a child to another blip" do
      setup { @child_blip = new_blip(:parent => @blip) }
      should "not be root" do
        assert !@child_blip.root?
      end
      should "have a proper parent blip" do
        assert_equal @blip, @child_blip.parent
      end
      should "be in the parent blip's collection of children" do
        assert @blip.children.include?(@child_blip)
      end
    end
  end

  protected

    def new_blip(options = {})
      wavelet = options[:wavelet] || new_wavelet
      Wave::Blip.new(
        { :wavelet => wavelet,
          :creator => new_participant(:wavelet => wavelet)
        }.merge(options)
      )
    end

    def new_participant(options = {})
      Wave::Participant.new(:id => 'id@email.com',
                            :wavelet => options[:wavelet] || new_wavelet)
    end

    def new_wavelet
      Wave::Wavelet.new(:wave => Wave.new("someid@wave.google.com"))
    end

end
