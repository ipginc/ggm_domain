require "spec_helper"

describe GgmDomain::Image do

  describe '#cdn_path' do
    it 'mindsを指すimageのパスがcdnに変換される' do
      actual = GgmDomain::Image.cdn_path 'http://core.ipg-minds.jp/repix2/mnt/ipgna01d-smb/prod/monomedia/pgmst/1/media/onair/20130709/dummy.jpg'
      expected = 'https://img.bangumi.org/repix2/mnt/ipgna01d-smb/prod/monomedia/pgmst/1/media/onair/20130709/dummy.jpg'
      expect(actual).to eq expected
    end
  end

end