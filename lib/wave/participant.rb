# Participant
#
#  A participant is one of the humans or robots that have full
#  read/write access to a wavelet.  Participants are identified
#  by a unique id that (conveniently) is in the exact format of
#  an email address.
#  

class Wave
  class Participant

    attr_reader :wavelet, :id


    def initialize(options = {})
      @wavelet = options[:wavelet]
      raise Wave::WaveError, "Participant requires wavelet" unless @wavelet
      @wavelet.participants << self
      @id = options[:id]
      raise Wave::WaveError, "Participant requires id" unless @id
    end
  end
end