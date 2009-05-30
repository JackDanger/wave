class Wave
  module Events

    EVENTS = [
      'WAVELET_BLIP_CREATED',
      'WAVELET_BLIP_REMOVED',
      'WAVELET_PARTICIPANTS_CHANGED',
      'WAVELET_TIMESTAMP_CHANGED',
      'WAVELET_TITLE_CHANGED',
      'WAVELET_VERSION_CHANGED',
      'BLIP_CONTRIBUTORS_CHANGED',
      'BLIP_DELETED',
      'BLIP_SUBMITTED',
      'BLIP_TIMESTAMP_CHANGED',
      'BLIP_VERSION_CHANGED',
      'DOCUMENT_CHANGED',
      'FORM_BUTTON_CLICKED'
    ]

    EVENTS.each do |event|
      eval <<-EOMETHOD
        def #{event.downcase}(&block)
          raise "No callback action defined for #{event}" unless block
          add_callback_for(#{event}, block)
        end
      EOMETHOD
    end

    protected

      def add_callback_for(event, block)
        @callbacks ||= []
        @callbacks[event] ||= []
        @callbacks[event] << block
      end
  end
end