module GgmDomain
  module BroadCasters
    class << self
      ALLOW_SI_TYPE = [Si::Type::BS, Si::Type::CS, Si::Type::GROUND_WAVE, Si::Type::CS_PREMIUM].freeze

      def logo_url(si_type: nil, network_id: nil, service_id: nil, remote_controller_key: nil, size: nil)
        _si_type = si_type.to_i
        return nil unless ALLOW_SI_TYPE.include? _si_type
        if _si_type == Si::Type::BS
          entity = Entities::BsBroadCaster.new service_id: service_id
        else
          entity = Entities::BroadCaster.new(
              si_type: si_type,
              network_id: network_id,
              service_id: service_id,
              remote_controller_key: remote_controller_key
          )
        end
        return nil if entity.invalid?
        entity.logo_url size
      end
    end
  end
end