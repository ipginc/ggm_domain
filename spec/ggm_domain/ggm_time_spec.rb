require "spec_helper"

describe GgmDomain::GgmTime do
  require 'time'

  describe '#broad_cast_date' do
    context '2016-11-01 04:59の場合' do
      it '20161031が返却される' do
        actual = GgmDomain::GgmTime.broad_cast_date '2016-11-01 04:59'
        expected = '20161031'
        expect(actual).to eq expected
      end
      context '2016-11-01 05:00の場合' do
        it '20161101が返却される' do
          actual = GgmDomain::GgmTime.broad_cast_date '2016-11-01 05:00'
          expected = '20161101'
          expect(actual).to eq expected
        end
      end
      context '2016-12-20 12:00の場合' do
        it '20161220が返却される' do
          actual = GgmDomain::GgmTime.broad_cast_date '2016-12-20 12:00'
          expected = '20161220'
          expect(actual).to eq expected
        end
      end
    end
  end

  describe '#today_start_time' do
    context '2016-11-11 5:00の場合' do
      before do
        t = Time.local(2016, 11, 11, 5, 0, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '2016111105が返却される' do
        actual = GgmDomain::GgmTime.today_start_time
        expected = '2016111105'
        expect(actual).to eq expected
      end
    end

    context '2016-11-11 4:59の場合' do
      before do
        t = Time.local(2016, 11, 11, 4, 59, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '2016111005が返却される' do
        actual = GgmDomain::GgmTime.today_start_time
        expected = '2016111005'
        expect(actual).to eq expected
      end
    end

    context '2016-12-21 8:59の場合' do
      before do
        t = Time.local(2016, 12, 21, 8, 59, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '2016122105が返却される' do
        actual = GgmDomain::GgmTime.today_start_time
        expected = '2016122105'
        expect(actual).to eq expected
      end
    end
  end

  describe '#today_end_time' do
    context '2016-11-11 5:00の場合' do
      before do
        t = Time.local(2016, 11, 11, 5, 0, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '201611120459が返却される' do
        actual = GgmDomain::GgmTime.today_end_time
        expected = '201611120459'
        expect(actual).to eq expected
      end
    end

    context '2016-11-11 4:59の場合' do
      before do
        t = Time.local(2016, 11, 11, 4, 59, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '201611110459が返却される' do
        actual = GgmDomain::GgmTime.today_end_time
        expected = '201611110459'
        expect(actual).to eq expected
      end
    end

    context '2016-12-21 8:59の場合' do
      before do
        t = Time.local(2016, 12, 21, 8, 59, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '201612220459が返却される' do
        actual = GgmDomain::GgmTime.today_end_time
        expected = '201612220459'
        expect(actual).to eq expected
      end
    end
  end

  describe '#display_formated_date_time' do
    context '2016-11-11 5:00の場合' do
      before do
        t = Time.local(2016, 11, 11, 5, 0, 0)
        Timecop.travel(t)
      end
      after do
        Timecop.return
      end
      it '2016-11-11 05:00が返却される' do
        actual = GgmDomain::GgmTime.display_formated_date_time Time.now
        expected = '2016-11-11 05:00'
        expect(actual).to eq expected
      end
    end
  end

  describe '#program_start_time' do
    context '20161111の場合' do
      it '2016-11-11 05:00 +0900 のDateTimeが返却される' do
        actual = GgmDomain::GgmTime.program_start_time '20161111'
        expected = '2016-11-11 05:00:00 +0900'
        expect(actual.to_s).to eq expected
      end
    end
  end

  describe '.program_start_time' do
    let(:test_class) { Struct.new(:mock) { include EpgDomainInfo } }
    let(:mock) { test_class.new }
    context '20160810を指定した場合' do
      it '2016/8/10 5:00の Time Object が返却される' do
        expected = Time.mktime 2016, 8, 10, 5
        actual = GgmDomain::GgmTime.program_start_time '20160810'
        expect(actual).to eq expected
      end
    end
  end

  describe '.calc_epg_term' do
    let(:mock) { test_class.new }
    context '20160810を指定した場合' do
      it '2016/8/10 5:00の Time Object と 2016/8/11  5:00の Time Object が返却される' do
        expected_1, expected_2 = Time.mktime(2016, 8, 10, 5), Time.mktime(2016, 8, 11, 5)
        actual_1, actual_2 = GgmDomain::GgmTime.calc_epg_term '20160810'
        expect(actual_1).to eq expected_1
        expect(actual_2).to eq expected_2
      end
    end
  end

  describe '.program_switch_time' do
    context '月末でない場合' do
      it '5時〜23時の指定で、翌日の4:59が返却される' do
        day_time = DateTime.new(2016, 9, 1, 16, 20, 45)
        expected = Time.mktime(2016, 9, 2, 4, 59, 59)
        expect(GgmDomain::GgmTime.program_switch_time(day_time)).to eq expected
      end

      it '5時の指定で、翌日の4:59が返却される' do
        day_time = DateTime.new(2016, 9, 1, 5, 0, 0)
        expected = Time.mktime(2016, 9, 2, 4, 59, 59)
        expect(GgmDomain::GgmTime.program_switch_time(day_time)).to eq expected
      end

      it '23時の指定で、翌日の4:59が返却される' do
        day_time = DateTime.new(2016, 9, 1, 23, 0, 0)
        expected = Time.mktime(2016, 9, 2, 4, 59, 59)
        expect(GgmDomain::GgmTime.program_switch_time(day_time)).to eq expected
      end

      let(:day_time) { DateTime.new(2016, 9, 1, 4, 59, 59) }
      it '4時の指定で、当日の4:59が返却される' do
        day_time = DateTime.new(2016, 9, 1, 4, 59, 59)
        expected = Time.mktime(2016, 9, 1, 4, 59, 59)
        expect(GgmDomain::GgmTime.program_switch_time(day_time)).to eq expected
      end
    end

    context '月末の場合' do
      it '5時〜23時の指定で、翌日の4:59が返却される' do
        day_time = DateTime.new(2016, 8, 31, 16, 20, 45)
        expected = Time.mktime(2016, 9, 1, 4, 59, 59)
        expect(GgmDomain::GgmTime.program_switch_time(day_time)).to eq expected
      end
    end
  end

end