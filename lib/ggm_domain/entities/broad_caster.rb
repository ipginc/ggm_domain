module GgmDomain
  module Entities
    class BroadCaster < Base
      DEFAULT_LOGO_SIZE = 46.freeze
      LOGO_TYPE_MAP = {Si::Type::CS => 'css'.freeze, Si::Type::GROUND_WAVE => 'otd'.freeze, Si::Type::CS_PREMIUM => 'csp'.freeze}.freeze

      attribute :si_type, Integer
      attribute :network_id, String
      attribute :service_id, String
      attribute :remote_controller_key, Integer

      validates :si_type, inclusion: {in: [Si::Type::CS, Si::Type::GROUND_WAVE, Si::Type::CS_PREMIUM]}
      validates :network_id, format: {with: /\A0x.+/i}, if: "si_type != #{Si::Type::CS_PREMIUM}"
      validate :service_id_valid?
      validates :remote_controller_key, presence: true

      def network_id
        si_type == Si::Type::CS_PREMIUM ? Si::NetworkId::CSP : @network_id
      end

      def logo_url(size = nil)
        return nil if self.invalid?
        "#{Image::BASE}monomedia/logo/#{LOGO_TYPE_MAP[si_type]}/logo-#{network_id[2, 4]}-#{picture_id}-#{logo_size size}x#{logo_size size}.png"
      end

      private
      def logo_size(size)
        size.nil? ? DEFAULT_LOGO_SIZE : size
      end

      def picture_id
        if si_type == Si::Type::GROUND_WAVE
          format '%02d1', remote_controller_key
        else
          service_id
        end
      end

      def service_id_valid?
        unless service_id.present?
          errors.add(:service_id, "service_id not acceptable")
          return
        end
        if si_type == Si::Type::GROUND_WAVE
          errors.add(:service_id, "service_id not acceptable ground wave") unless service_id.match(/\A0x.+/i)
        end
      end
    end
  end
end