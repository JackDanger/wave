# Wavelet
#
#  A wavelet has a list of participants that can be any mixture
#  of humans or robots.  This set of participants is distinct from
#  the participants of any other wavelet in the wave.
#  A wavelet also contains a set of 'blips' which are an ordered
#  set of operations serving to create a history for the wavelet.
#  These blips contain the documents that make up the real content
#  of the wavelet.
#  


class Wave
  class Wavelet

    attr_reader :wave, :options, :participants, :blips

    def initialize(options = {})
      raise Wave::WaveError,
            "Wavelets must be instantiated with a wave option" unless
                options[:wave] && options[:wave].is_a?(Wave)
      
      @wave         = options.delete(:wave)
      @participants = options.delete(:participants) || []
      @blips        = options.delete(:blips) || []
      @wave.wavelets << self
    end
  end
end