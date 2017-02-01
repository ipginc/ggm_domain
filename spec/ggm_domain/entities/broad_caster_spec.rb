require "spec_helper"

describe GgmDomain::Entities::BroadCaster do
  context '全て正常に設定されている場合' do
    let(:entity) do
      GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
    end

    it '#si_type' do
      expected = 3
      actual = entity.si_type
      expect(actual).to eq(expected)
    end

    it '#network_id' do
      expected = '0x7E67'
      actual = entity.network_id
      expect(actual).to eq(expected)
    end

    it '#service_id' do
      expected = '0x6438'
      actual = entity.service_id
      expect(actual).to eq(expected)
    end

    it '#remote_controller_key' do
      expected = 5
      actual = entity.remote_controller_key
      expect(actual).to eq(expected)
    end

  end

  describe 'バリデーションエラーのチェック' do
    describe '#si_type' do
      context '2の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 2, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '3の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '9の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 9, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '1の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 1, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
      context '10の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 10, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
    end

    describe '#network_id' do
      context '0xで始まる場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '0x以外で始まる場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: 'a0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
      context '未設定の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
    end
    describe '#service_id' do
      context '地上波の場合' do
        context '0xで始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
          end
          it 'バリデーションが正常である' do
            actual = entity.valid?
            expect(actual).to be_truthy
          end
        end
        context '0x以外で始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '6438', remote_controller_key: 5
          end
          it 'バリデーションエラーである' do
            actual = entity.valid?
            expect(actual).to be_falsey
          end
        end
        context '未設定の場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', remote_controller_key: 5
          end
          it 'バリデーションエラーである' do
            actual = entity.valid?
            expect(actual).to be_falsey
          end
        end
      end
      context 'CSの場合' do
        context '0xで始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 2, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
          end
          it 'バリデーションが正常である' do
            actual = entity.valid?
            expect(actual).to be_truthy
          end
        end
        context '0x以外で始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 2, network_id: '0x7E67', service_id: '6438', remote_controller_key: 5
          end
          it 'バリデーションが正常である' do
            actual = entity.valid?
            expect(actual).to be_truthy
          end
        end
      end
      context 'CSPの場合' do
        context '0xで始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 9, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
          end
          it 'バリデーションが正常である' do
            actual = entity.valid?
            expect(actual).to be_truthy
          end
        end
        context '0x以外で始まる値が設定されている場合' do
          let(:entity) do
            GgmDomain::Entities::BroadCaster.new si_type: 9, network_id: '0x7E67', service_id: '6438', remote_controller_key: 5
          end
          it 'バリデーションが正常である' do
            actual = entity.valid?
            expect(actual).to be_truthy
          end
        end
      end
    end
    describe '#remote_controller_key' do
      context '設定されている場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '0x6438', remote_controller_key: 5
        end
        it 'バリデーションが正常である' do
          actual = entity.valid?
          expect(actual).to be_truthy
        end
      end
      context '未設定の場合' do
        let(:entity) do
          GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7E67', service_id: '90x6438'
        end
        it 'バリデーションエラーである' do
          actual = entity.valid?
          expect(actual).to be_falsey
        end
      end
    end

  end

  describe '#network_id' do
    context 'CSの場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 2, network_id: '0x0006', service_id: 218, remote_controller_key: 5
      end
      it '指定した0x0006である' do
        expected = '0x0006'
        actual = entity.network_id
        expect(actual).to eq(expected)
      end
    end
    context '地上波の場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7FE0', service_id: '0x0400', remote_controller_key: 1
      end
      it '指定した0x7FE0である' do
        expected = '0x7FE0'
        actual = entity.network_id
        expect(actual).to eq(expected)
      end
    end
    context 'CSPの場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 9, network_id: '0x000A', service_id: '400', remote_controller_key: 1
      end
      it '0x000Aである' do
        expected = '0x000A'
        actual = entity.network_id
        expect(actual).to eq(expected)
      end
    end

  end

  describe '#logo_url' do
    context 'CSの場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 2, network_id: '0x0006', service_id: 218, remote_controller_key: 5
      end
      context 'サイズ指定した場合' do
        it '指定したサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/css/logo-0006-218-75x75.png'
          actual = entity.logo_url 75
          expect(actual).to eq(expected)
        end
      end
      context 'サイズ指定しなかった場合' do
        it 'デフォルトサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/css/logo-0006-218-46x46.png'
          actual = entity.logo_url
          expect(actual).to eq(expected)
        end
      end
    end
    context '地上波の場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 3, network_id: '0x7FE0', service_id: '0x0400', remote_controller_key: 1
      end
      context 'サイズ指定した場合' do
        it '指定したサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/otd/logo-7FE0-011-75x75.png'
          actual = entity.logo_url 75
          expect(actual).to eq(expected)
        end
      end
      context 'サイズ指定しなかった場合' do
        it 'デフォルトサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/otd/logo-7FE0-011-46x46.png'
          actual = entity.logo_url
          expect(actual).to eq(expected)
        end
      end
    end
    context 'CSPの場合' do
      let(:entity) do
        GgmDomain::Entities::BroadCaster.new si_type: 9, network_id: '0x000A', service_id: '400', remote_controller_key: 1
      end
      context 'サイズ指定した場合' do
        it '指定したサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/csp/logo-000A-400-75x75.png'
          actual = entity.logo_url 75
          expect(actual).to eq(expected)
        end
      end
      context 'サイズ指定しなかった場合' do
        it 'デフォルトサイズのロゴが出力される' do
          expected = 'https://img.bangumi.org/monomedia/logo/csp/logo-000A-400-46x46.png'
          actual = entity.logo_url
          expect(actual).to eq(expected)
        end
      end
    end

  end
end