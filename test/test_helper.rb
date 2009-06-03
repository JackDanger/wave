require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'wave'
class Test::Unit::TestCase
  module Factory
    class << self

      def wave(options = {})
        Wave.new(
          options[:id] || "id#{sequence}@wave.google.com",
          options
        )
      end

      def wavelet(options = {})
        Wave::Wavelet.new(
          { :wave => options[:wave] || Factory.wave
          }.merge(options)
        )
      end

      def participant(options = {})
        Wave::Participant.new(
          { :id => "id#{sequence}@email.com",
            :wavelet => options[:wavelet] || Factory.wavelet
          }.merge(options)
        )
      end

      def blip(options = {})
        wavelet = options[:wavelet] || Factory.wavelet
        Wave::Blip.new(
          { :wavelet => wavelet,
            :content => "<xml></xml>",
            :creator => Factory.participant(:wavelet => wavelet)
          }.merge(options)
        )
      end

      def document(options = {})
        Wave::Document.new(
          'IMAGE',
          { :wavelet => wavelet,
            :blip    => Factory.blip,
            :creator => Factory.participant(:wavelet => wavelet)
          }.merge(options)
        )
      end

      def annotation(options = {})
        Wave::Annotation.new(
          options[:document] || Factory.document,
          options[:name]     || "Annotation#{sequence}",
          options[:value]    || "content number #{sequence}",
          options[:range]    || 4..11
        )
      end

      protected
        def sequence
          @sequence ||= 0
          @sequence += 1
        end
    end
  end
end
