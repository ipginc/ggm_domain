require "spec_helper"

describe GgmDomain::Entities::BsBroadCaster do
  context '全て正常に設定されている場合' do
    let(:entity) do
      GgmDomain::Entities::BsBroadCaster.new service_id: 389
    end

    it '#service_id' do
      expected = '389'
      actual = entity.service_id
      expect(actual).to eq(expected)
    end

  end

  describe 'バリデーションエラーのチェック' do
    describe '#service_id' do
      context '3桁の場合' do
        let(:entity) do
          GgmDomain::Entities::BsBroadCaster.new service_id: 389
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '0x以外で始まる場合' do
        let(:entity) do
          GgmDomain::Entities::BsBroadCaster.new service_id: 3890
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
      context '未設定の場合' do
        let(:entity) do
          GgmDomain::Entities::BsBroadCaster.new
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
    end
  end

  describe 'si_type' do
    let(:entity) do
      GgmDomain::Entities::BsBroadCaster.new service_id: 389
    end
    it '1固定で返却される' do
      expected = 1
      actual = entity.si_type
      expect(actual).to eq(expected)
    end
  end

  describe 'network_id' do
    let(:entity) do
      GgmDomain::Entities::BsBroadCaster.new service_id: 389
    end
    it '0x004固定で返却される' do
      expected = '0x0004'
      actual = entity.network_id
      expect(actual).to eq(expected)
    end
  end


  describe '#logo_url' do
    let(:entity) do
      GgmDomain::Entities::BsBroadCaster.new service_id: 101
    end
    context 'サイズ指定した場合' do
      it '指定したサイズのロゴが出力される' do
        expected = 'https://img.bangumi.org/monomedia/logo/bsd/logo-0004-101-75x75.png'
        actual = entity.logo_url 75
        expect(actual).to eq(expected)
      end
    end
    context 'サイズ指定しなかった場合' do
      it 'デフォルトサイズのロゴが出力される' do
        expected = 'https://img.bangumi.org/monomedia/logo/bsd/logo-0004-101-46x46.png'
        actual = entity.logo_url
        expect(actual).to eq(expected)
      end
    end
  end
end