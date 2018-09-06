require "spec_helper"

describe GgmDomain::Browser do

  UA_OF_IPHONE = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13F69 Safari/601."
  UA_OF_IPAD = "Mozilla/5.0 (iPad; CPU OS 9_3_1 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/50.0.2661.77 Mobile/13E238 Safari/601.1.46"
  UA_OF_IPOD = "Mozilla/5.0 (iPod; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/5.1.42378 Mobile/12B466 Safari/600.1.4"

  UA_OF_AU_SOV34_CR = "Mozilla/5.0 (Linux; Android 6.0.1; SOV34 Build/39.0.C.0.282) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.81 Mobile Safari/537.36"
  UA_OF_AU_SOV34_WV = "Mozilla/5.0 (Linux; Android 6.0.1; SOV34 Build/39.0.C.0.282; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/51.0.2704.81 Mobile Safari/537.36"
  UA_OF_AU_SCV32_BR = "Mozilla/5.0 (Linux; Android 5.1.1; SCV32 Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.5 Chrome/38.0.2125.102 Mobile Safari/537.36"
  UA_OF_AU_SCV32_CR = "Mozilla/5.0 (Linux; Android 5.1.1; SCV32 Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.93 Mobile Safari/537.36"
  UA_OF_AU_SCV32_WV = "Mozilla/5.0 (Linux; Android 5.1.1; SCV32 Build/LMY47X; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/43.0.2357.121 Mobile Safari/537.36"

  UA_OF_DOCOMO_SH04H_CR = "Mozilla/5.0 (Linux; Android 7.0; SH-04H Build/SB247) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.85 Mobile Safari/537.36"
  UA_OF_DOCOMO_F04H_CR = "Mozilla/5.0 (Linux; Android 6.0.1; F-04H Build/V11R047B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Safari/537.36"
  UA_OF_DOCOMO_SO_01L_CR = "Mozilla/5.0 (Linux; Android 9; SO-01L Build/VVVV) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.124 Mobile Safari/537.36"

  UA_OF_SB_NEXUS6P_CR = "Mozilla/5.0 (Linux; Android 7.0; Nexus 6P Build/XXXXXXX) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.90 Mobile Safari/537.36"

  OLD_TYPE_UA = "Mozilla/5.0 (Linux; U; Android 4.4.2; ja-jp; SonySO-02E Build/10.5.1.B.0.155) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
  OLD_TYPE_UA2 = "Mozilla/5.0 (Linux; U; Android 2.3.4; ja-jp; SBM003SH Build/S4040) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1 GGM"

  UA_OF_MAC = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17"

  GGM_ANDROID_LG = "Mozilla/5.0 (Linux; Android 5.0.2; DM-01G Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.93 Mobile Safari/537.36 GGM"

  GGM_IOS = "Mozilla/5.0 (Linux; Android 5.0.2; DM-01G Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.93 Mobile Safari/537.36 GGM"

  GOOGLE_BOT_PC = 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

  GOOGLE_BOT_SP = '​Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'

  BEING_BOT = 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'

  describe '#what_is_os_name' do
    context 'IOSの場合' do
      context 'iPhoneの場合' do
        it 'iPhoneが返却される' do
          actual = GgmDomain::Browser.what_is_os_name UA_OF_IPHONE
          expected = 'iPhone'
          expect(actual).to eq expected
        end
      end
      context 'iPadの場合' do
        it 'iPadが返却される' do
          actual = GgmDomain::Browser.what_is_os_name UA_OF_IPAD
          expected = 'iPad'
          expect(actual).to eq expected
        end
      end
      context 'iPodの場合' do
        it 'iPodが返却される' do
          actual = GgmDomain::Browser.what_is_os_name UA_OF_IPOD
          expected = 'iPod'
          expect(actual).to eq expected
        end
      end
    end

    describe 'Android' do
      context 'auの場合' do
        context 'Xperia XZ SOV34 chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_AU_SOV34_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end

        context 'Xperia XZ SOV34 webviewの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_AU_SOV34_WV
            expected = 'Android'
            expect(actual).to eq expected
          end
        end

        context 'Galaxy A8 SCV32 標準ブラウザの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_AU_SCV32_BR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end

        context 'Galaxy A8 SCV32 chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_AU_SCV32_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end

        context 'Galaxy A8 SCV32 webviewの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_AU_SCV32_WV
            expected = 'Android'
            expect(actual).to eq expected
          end
        end
      end

      context 'docomoの場合' do
        context 'SH04H chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_DOCOMO_SH04H_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end
        context 'F04H chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_DOCOMO_F04H_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end
        context 'SO-01L chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_DOCOMO_SO_01L_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end
      end

      context 'softbankの場合' do
        context 'NEXUS6P chromeの場合' do
          it 'Androidが返却される' do
            actual = GgmDomain::Browser.what_is_os_name UA_OF_SB_NEXUS6P_CR
            expected = 'Android'
            expect(actual).to eq expected
          end
        end
      end

      context '古い形式のUAの場合' do
        it 'Androidが返却される' do
          actual = GgmDomain::Browser.what_is_os_name OLD_TYPE_UA
          expected = 'Android'
          expect(actual).to eq expected
        end
      end
    end
  end

  describe '#is_ios?' do
    context 'iPhoneの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_ios? UA_OF_IPHONE
        expect(actual).to be_truthy
      end
    end
    context 'iPadの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_ios? UA_OF_IPAD
        expect(actual).to be_truthy
      end
    end
    context 'iPodの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_ios? UA_OF_IPOD
        expect(actual).to be_truthy
      end
    end
    context 'NEXUS6P chromeの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_ios? UA_OF_SB_NEXUS6P_CR
        expect(actual).to be_falsey
      end
    end
    context 'Macの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_ios? UA_OF_MAC
        expect(actual).to be_falsey
      end
    end
  end

  describe '#is_android?' do
    context 'iPhoneの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_android? UA_OF_IPHONE
        expect(actual).to be_falsey
      end
    end
    context 'iPadの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_android? UA_OF_IPAD
        expect(actual).to be_falsey
      end
    end
    context 'iPodの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_android? UA_OF_IPOD
        expect(actual).to be_falsey
      end
    end
    context 'NEXUS6P chromeの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_android? UA_OF_SB_NEXUS6P_CR
        expect(actual).to be_truthy
      end
    end
    context 'Macの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_android? UA_OF_MAC
        expect(actual).to be_falsey
      end
    end
  end

  describe '#is_pc?' do
    context 'iPhoneの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_pc? UA_OF_IPHONE
        expect(actual).to be_falsey
      end
    end
    context 'iPadの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_pc? UA_OF_IPAD
        expect(actual).to be_falsey
      end
    end
    context 'iPodの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_pc? UA_OF_IPOD
        expect(actual).to be_falsey
      end
    end
    context 'NEXUS6P chromeの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_pc? UA_OF_SB_NEXUS6P_CR
        expect(actual).to be_falsey
      end
    end
    context 'Macの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_pc? UA_OF_MAC
        expect(actual).to be_truthy
      end
    end
  end

  describe '#android_device_name' do
    context 'Macの場合' do
      it 'nilが返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_MAC
        expect(actual).to be_nil
      end
    end

    context 'iPhoneの場合' do
      it 'nilが返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_IPHONE
        expect(actual).to be_nil
      end
    end

    context 'Android7 NEXUS6Pの場合' do
      it 'Nexus 6Pが返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_SB_NEXUS6P_CR
        expected = 'Nexus 6P'
        expect(actual).to eq(expected)
      end
    end

    context 'Android5 SCV32の場合' do
      it 'SCV32が返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_AU_SCV32_WV
        expected = 'SCV32'
        expect(actual).to eq(expected)
      end
    end

    context 'Android6 SOV34の場合' do
      it 'SOV34が返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_AU_SOV34_CR
        expected = 'SOV34'
        expect(actual).to eq(expected)
      end
    end

    context 'Android9 SO-01Lの場合' do
      it 'SO-01Lが返却される' do
        actual = GgmDomain::Browser.android_device_name UA_OF_DOCOMO_SO_01L_CR
        expected = 'SOV34'
        expect(actual).to eq(expected)
      end
    end

    context '古い形式のUAの場合1' do
      it 'SonySO-02E　が返却される' do
        actual = GgmDomain::Browser.android_device_name OLD_TYPE_UA
        expected = 'SonySO-02E'
        expect(actual).to eq(expected)
      end
    end

    context '古い形式のUAの場合2' do
      it 'SBM003SH　が返却される' do
        actual = GgmDomain::Browser.android_device_name OLD_TYPE_UA2
        expected = 'SBM003SH'
        expect(actual).to eq(expected)
      end
    end

  end

  describe '#is_ggm?' do
    context 'GGM以外の場合' do
      context 'Androidの場合' do
        it 'falseが返却される' do
          actual = GgmDomain::Browser.is_ggm? UA_OF_AU_SOV34_CR
          expect(actual).to be_falsey
        end
      end
      context 'IPhoneの場合' do
        it 'falseが返却される' do
          actual = GgmDomain::Browser.is_ggm? UA_OF_IPHONE
          expect(actual).to be_falsey
        end
      end
    end
    context 'GGMの場合' do
      context 'Androidの場合' do
        it 'trueが返却される' do
          actual = GgmDomain::Browser.is_ggm? GGM_ANDROID_LG
          expect(actual).to be_truthy
        end
      end
      context 'IPhoneの場合' do
        it 'trueが返却される' do
          actual = GgmDomain::Browser.is_ggm? GGM_IOS
          expect(actual).to be_truthy
        end
      end
    end

  end

  describe GgmDomain::Browser::AccessInfo do
    context 'Andoroid Browser SOV34の場合' do
      let(:access_info) do
        GgmDomain::Browser::AccessInfo.new UA_OF_AU_SOV34_CR
      end

      it '端末名が SOV34 である' do
        actual = access_info.device
        expected = 'SOV34'
        expect(actual).to eq(expected)
      end

      it 'osが Android である' do
        actual = access_info.os
        expected = 'Android'
        expect(actual).to eq(expected)
      end

      it 'is_ios?が false である' do
        actual = access_info.is_ios?
        expect(actual).to be_falsey
      end

      it 'is_android?が true である' do
        actual = access_info.is_android?
        expect(actual).to be_truthy
      end

      it 'is_pc?がfalseである' do
        actual = access_info.is_pc?
        expect(actual).to be_falsey
      end

      it 'is_ggm?が false である' do
        actual = access_info.is_ggm?
        expect(actual).to be_falsey
      end
    end

    context 'iOS Browser　の場合' do
      let(:access_info) do
        GgmDomain::Browser::AccessInfo.new UA_OF_IPHONE
      end

      it '端末名が iPhone である' do
        actual = access_info.device
        expected = 'iPhone'
        expect(actual).to eq(expected)
      end

      it 'osが iPhone である' do
        actual = access_info.os
        expected = 'iPhone'
        expect(actual).to eq(expected)
      end

      it 'is_ios?が true である' do
        actual = access_info.is_ios?
        expect(actual).to be_truthy
      end

      it 'is_android?が false である' do
        actual = access_info.is_android?
        expect(actual).to be_falsey
      end

      it 'is_pc?がfalseである' do
        actual = access_info.is_pc?
        expect(actual).to be_falsey
      end

      it 'is_ggm?が false である' do
        actual = access_info.is_ggm?
        expect(actual).to be_falsey
      end
    end

    context 'Andoroid GGMの場合' do
      let(:access_info) do
        GgmDomain::Browser::AccessInfo.new GGM_ANDROID_LG
      end

      it 'is_ggm?が true である' do
        actual = access_info.is_ggm?
        expect(actual).to be_truthy
      end
    end

    context 'iOS GGMの場合' do
      let(:access_info) do
        GgmDomain::Browser::AccessInfo.new GGM_IOS
      end
      it 'is_ggm?が true である' do
        actual = access_info.is_ggm?
        expect(actual).to be_truthy
      end
    end

    context 'PC　の場合' do
      let(:access_info) do
        GgmDomain::Browser::AccessInfo.new UA_OF_MAC
      end

      it '端末名が Mac OSX である' do
        actual = access_info.device
        expected = 'Mac OSX'
        expect(actual).to eq(expected)
      end

      it 'osが Mac OSX である' do
        actual = access_info.os
        expected = 'Mac OSX'
        expect(actual).to eq(expected)
      end

      it 'is_ios?が false である' do
        actual = access_info.is_ios?
        expect(actual).to be_falsey
      end

      it 'is_android?が false である' do
        actual = access_info.is_android?
        expect(actual).to be_falsey
      end

      it 'is_pc?がtrueである' do
        actual = access_info.is_pc?
        expect(actual).to be_truthy
      end

      it 'is_ggm?が false である' do
        actual = access_info.is_ggm?
        expect(actual).to be_falsey
      end
    end

  end

  describe '#is_crawler?' do
    context 'IOSの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? UA_OF_IPHONE
        expect(actual).to be_falsey
      end
    end
    context 'iPadの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? UA_OF_IPAD
        expect(actual).to be_falsey
      end
    end
    context 'iPodの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? UA_OF_IPOD
        expect(actual).to be_falsey
      end
    end
    context 'Macの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? UA_OF_MAC
        expect(actual).to be_falsey
      end
    end
    context 'Andoroid GGMの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? GGM_ANDROID_LG
        expect(actual).to be_falsey
      end
    end

    context 'iOS GGMの場合' do
      it 'falseが返却される' do
        actual = GgmDomain::Browser.is_crawler? GGM_IOS
        expect(actual).to be_falsey
      end
    end

    context 'google crawler pcの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_crawler? GOOGLE_BOT_PC
        expect(actual).to be_truthy
      end
    end

    context 'google crawler pcの場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_crawler? GOOGLE_BOT_PC
        expect(actual).to be_truthy
      end
    end

    context 'Being bot の場合' do
      it 'trueが返却される' do
        actual = GgmDomain::Browser.is_crawler? BEING_BOT
        expect(actual).to be_truthy
      end
    end

  end

end