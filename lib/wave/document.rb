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

    ELEMENT_TYPES = ['INLINE_BLIP', 'INPUT', 'CHECK', 'LABEL',
                     'BUTTON', 'RADIO_BUTTON', 'RADIO_BUTTON_GROUP',
                     'PASSWORD', 'GADGET', 'IMAGE']

    attr_reader :blip, :elements, :annotations

    def initialize(type, options = {})
      @type         = type
      @blip         = options.delete(:blip)
      @options      = options
      @elements     = []
      @annotations  = []
      raise Wave::WaveError, "Document has no blip" unless blip
      blip.document = self
    end

    def wavelet
      blip.wavelet
    end

    def wave
      wavelet.wave
    end

  end
end