# Annotation
#
#  Documents have annotations that span a range of the
#  document's length.  An annotation is a key/value pair
#  applied to some portion of the document.
#
#

class Wave
  class Annotation

    attr_reader :document, :name, :value, :range

    def initialize(document, name, value, range = 0..0)
      @document = document
      @name     = name
      @value    = value
      @range    = range
      raise Wave::WaveError, "Annotation has no document" unless document
      document.annotations << self
    end
  end
end