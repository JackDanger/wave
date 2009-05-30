require File.dirname(__FILE__) + '/test_helper'

class AnnotationTest < Test::Unit::TestCase

  context "a annotation" do
    setup { @annotation = Factory.annotation }
    should "have a document" do
      assert @annotation.document
    end
    should "have a name" do
      assert @annotation.name
    end
    should "have a value" do
      assert @annotation.value
    end
    should "have a range" do
      assert @annotation.range
    end
    should "register itself as an annotation in its document" do
      assert @annotation.document.annotations.include?(@annotation)
    end
  end
end
