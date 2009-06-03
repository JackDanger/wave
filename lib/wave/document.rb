# Document
#
#  A document is attached to a blip and contains the interesting
#  data for this element of the conversation.
#
#  Documents contain annotations, elements and a serialized
#  
#  

class Wave
  class Document

    attr_reader :blip, :source, :annotations

    def initialize(type, options = {})
      @blip         = options.delete(:blip)
      @options      = options
      @annotations  = []
      raise Wave::WaveError, "Document has no blip" unless blip
      blip.document = self
    end

    def items
      source.to_s.scan(/<.*?>|./).flatten
    end

    def source
      blip.content
    end

    def wavelet
      blip.wavelet
    end

    def wave
      wavelet.wave
    end

  end
end