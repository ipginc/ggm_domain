require "spec_helper"

describe GgmDomain::Si do
  require 'ostruct'

  describe '#main_image' do
    context 'エピソードカットがある場合' do
      let(:si) do
        [
            OpenStruct.new({cid: 'LOGO', url: 'http://logo.ipg.com'}),
            OpenStruct.new({cid: 'THUMB', url: 'http://thum.ipg.com'}),
            OpenStruct.new({cid: 'MainCut', url: 'http://maincut.ipg.com'}),
            OpenStruct.new({cid: 'LOGO', url: 'http://logo2.ipg.com'})
        ]
      end
      it 'エピソードカットが返却される' do
        actual = GgmDomain::Si.main_image si
        expected = 'http://thum.ipg.com'
        expect(actual).to eq expected
      end
    end

    context 'エピソードカットなしでメインカットとがロゴがある場合' do
      let(:si) do
        [
            OpenStruct.new({cid: 'MainCut', url: 'http://maincut.ipg.com'}),
            OpenStruct.new({cid: 'LOGO', url: 'http://logo.ipg.com'})
        ]
      end
      it 'メインカットが返却される' do
        actual = GgmDomain::Si.main_image si
        expected = 'http://maincut.ipg.com'
        expect(actual).to eq expected
      end
    end

    context 'ロゴのみの場合' do
      let(:si) do
        [
            OpenStruct.new({cid: 'LOGO', url: 'http://logo.ipg.com'})
        ]
      end
      it 'メインカットが返却される' do
        actual = GgmDomain::Si.main_image si
        expected = 'http://logo.ipg.com'
        expect(actual).to eq expected
      end
    end

  end

end