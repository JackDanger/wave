# Blip
#
#  A blip is a historical operation performed on a wavelet. If the
#  wavelet is a conversation then this is the smallest meaningful
#  element of that conversation.  Blips can be arranged in a tree
#  structure with parent/child relationships and each wavelet has
#  a 'root' blip that is considered the first element of the wavelet.
#
#  Each blip contains a document which holds all the interesting
#  content of the blip.
#  

class Wave
  class Blip

    attr_reader :wavelet, :parent, :children, :creator
    attr_accessor :document

    def initialize(options = {})
      if options[:parent]
        @parent = options[:parent]
        @parent.children << self
        @wavelet = @parent.wavelet
      end
      @wavelet ||= options[:wavelet]
      raise Wave::WaveError, "Blip has no wavelet" unless @wavelet
      @creator = options[:creator]
      raise Wave::WaveError, "Blip has no creator" unless @creator
      @wavelet.blips << self
      @children ||= []
    end

    def root?
      self == wavelet.blips.first
    end

    def wave
      wavelet.wave
    end

  end
end