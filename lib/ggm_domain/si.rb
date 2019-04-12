module GgmDomain
  module Si
    module Type
      BS = 1.freeze
      CS = 2.freeze
      GROUND_WAVE = 3.freeze
      CS_PREMIUM = 9.freeze
      BS4K = 20.freeze
      CS4K = 30.freeze
      CUSTOM = 99.freeze
      RADIKO = 600.freeze
    end

    module NetworkId
      BS = '0x0004'.freeze
      CSP = '0x000A'.freeze
      NTV = '0x0410'.freeze
    end

    EPISODE_CUT = 'THUMB'.freeze
    REPRESENTATIVE_CUT = 'MainCut'.freeze
    PROGRAM_LOGO = 'LOGO'.freeze

    class << self
      def main_image(images)
        representative_cut, program_logo = '', ''
        images.each do |img|
          return img.url if img.cid == EPISODE_CUT
          representative_cut = img.url if img.cid == REPRESENTATIVE_CUT
          program_logo= img.url if img.cid ==PROGRAM_LOGO
        end
        representative_cut != '' ? representative_cut : program_logo
      end
    end
  end
end