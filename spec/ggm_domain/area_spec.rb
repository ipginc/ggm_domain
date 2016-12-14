require "spec_helper"

describe GgmDomain::Area do

  describe '#mapping_minds_to_ggm_code' do
    it '東京(23→42)' do
      actual = GgmDomain::Area.mapping_minds_to_ggm_code 23
      expected = 42
      expect(actual).to eq expected
    end

    it '神奈川(24→45)' do
      actual = GgmDomain::Area.mapping_minds_to_ggm_code 24
      expected = 45
      expect(actual).to eq expected
    end

    it '北海道(10→1)' do
      actual = GgmDomain::Area.mapping_minds_to_ggm_code 10
      expected = 1
      expect(actual).to eq expected
    end

    it '沖縄(62→134)' do
      actual = GgmDomain::Area.mapping_minds_to_ggm_code 62
      expected = 134
      expect(actual).to eq expected
    end

  end

end