require "spec_helper"

describe GgmDomain::BroadCasters do

  describe '正常系' do
    context 'BSの情報を指定した場合' do
      it 'サイズ指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/bsd/logo-0004-101-75x75.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 1, service_id: 101, size: 75
        expect(actual).to eq(expected)
      end
      it 'サイズ未指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/bsd/logo-0004-101-46x46.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 1, service_id: 101
        expect(actual).to eq(expected)
      end
    end
    context 'CSの情報を指定した場合' do
      it 'サイズ指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/css/logo-0006-218-75x75.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 2, network_id: '0x0006', service_id: 218, remote_controller_key: 5, size: 75
        expect(actual).to eq(expected)
      end
      it 'サイズ未指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/css/logo-0006-218-46x46.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 2, network_id: '0x0006', service_id: 218, remote_controller_key: 5
        expect(actual).to eq(expected)
      end
    end
    context '地上波の情報を指定した場合' do
      it 'サイズ指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/otd/logo-7FE0-011-75x75.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 3, network_id: '0x7FE0', service_id: '0x0400', remote_controller_key: 1, size: 75
        expect(actual).to eq(expected)
      end
      it 'サイズ未指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/otd/logo-7FE0-011-46x46.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 3, network_id: '0x7FE0', service_id: '0x0400', remote_controller_key: 1
        expect(actual).to eq(expected)
      end
    end
    context 'CSPの情報を指定した場合' do
      it 'サイズ指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/csp/logo-000A-400-75x75.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 9, service_id: '400', remote_controller_key: 1, size: 75
        expect(actual).to eq(expected)
      end
      it 'サイズ未指定で正しく値が返却される' do
        expected = 'https://img.bangumi.org/monomedia/logo/csp/logo-000A-400-46x46.png'
        actual = GgmDomain::BroadCasters.logo_url si_type: 9, service_id: '400', remote_controller_key: 1
        expect(actual).to eq(expected)
      end
    end
  end
  describe 'エラー系' do
    context 'si_type未入力の場合' do
      it 'nilが返却される' do
        actual = GgmDomain::BroadCasters.logo_url service_id: 101, size: 75
        expect(actual).to be_nil
      end
    end
    context '地上波でサービスidが地上波のものではない場合' do
      it 'nilが返却される' do
        actual = GgmDomain::BroadCasters.logo_url si_type: 3, network_id: '7FE0', service_id: '0x0400', remote_controller_key: 1, size: 75
        expect(actual).to be_nil
      end
    end
  end

end