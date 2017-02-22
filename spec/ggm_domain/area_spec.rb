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

  describe 'mapping_ggm_to_minds_code' do
    it '東京(42→23)' do
      actual = GgmDomain::Area.mapping_ggm_to_minds_code 42
      expected = 23
      expect(actual).to eq expected
    end

    it '神奈川(45→24)' do
      actual = GgmDomain::Area.mapping_ggm_to_minds_code 45
      expected = 24
      expect(actual).to eq expected
    end

    it '北海道(1→10)' do
      actual = GgmDomain::Area.mapping_ggm_to_minds_code 1
      expected = 10
      expect(actual).to eq expected
    end

    it '沖縄(134→62)' do
      actual = GgmDomain::Area.mapping_ggm_to_minds_code 134
      expected = 62
      expect(actual).to eq expected
    end

  end

  describe '#in_tver_area?' do
    context '茨城の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 31
        expect(actual).to be_truthy
      end
    end

    context '栃木の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 33
        expect(actual).to be_truthy
      end
    end
    context '群馬の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 35
        expect(actual).to be_truthy
      end
    end
    context '埼玉の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 37
        expect(actual).to be_truthy
      end
    end
    context '千葉の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 40
        expect(actual).to be_truthy
      end
    end
    context '東京の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 42
        expect(actual).to be_truthy
      end
    end
    context '神奈川の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Area.in_tver_area? 45
        expect(actual).to be_truthy
      end
    end

    context '沖縄の場合' do
      it 'falseが返却される' do
        actual =GgmDomain::Area.in_tver_area? 134
        expect(actual).to be_falsey
      end
    end

  end

end