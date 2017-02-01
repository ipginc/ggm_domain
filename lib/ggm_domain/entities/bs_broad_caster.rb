module GgmDomain
  module Entities
    class BsBroadCaster < Base
      DEFAULT_LOGO_SIZE = 46.freeze

      attribute :service_id, String

      validates :service_id, length: {is: 3}

      def si_type
        Si::Type::BS
      end

      def network_id
        Si::NetworkId::BS
      end

      def logo_url(size = nil)
        return nil if self.invalid?
        "#{Image::BASE}monomedia/logo/bsd/logo-0004-#{service_id}-#{logo_size(size)}x#{logo_size(size)}.png"
      end

      private
      def logo_size(size)
        size.nil? ? DEFAULT_LOGO_SIZE : size
      end
    end
  end
end
