require File.dirname(__FILE__) + '/test_helper'

class DocumentTest < Test::Unit::TestCase

  context "a document" do
    setup { @document = Factory.document }
    should "have a blip" do
      assert @document.blip
    end
    should "have a wavelet" do
      assert @document.wavelet
    end
    should "have a wave" do
      assert @document.wave
    end
    should "have a collection of annotations" do
      assert @document.annotations
    end
    should "have a collection of non-text elements" do
      assert @document.elements
    end
    should "register itself as its blip's document" do
      assert_equal @document, @document.blip.document
    end
  end
end