require "spec_helper"

describe GgmDomain::Time do
  describe '#broad_cast_date' do
    context '2016-11-01 04:59の場合' do
      it '20161031が返却される' do
        actual = GgmDomain::Time.broad_cast_date '2016-11-01 04:59'
        expected = '20161031'
        expect(actual).to eq expected
      end
      context '2016-11-01 05:00の場合' do
        it '20161101が返却される' do
          actual = GgmDomain::Time.broad_cast_date '2016-11-01 05:00'
          expected = '20161101'
          expect(actual).to eq expected
        end
      end
      context '2016-12-20 12:00の場合' do
        it '20161220が返却される' do
          actual = GgmDomain::Time.broad_cast_date '2016-12-20 12:00'
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
        actual = GgmDomain::Time.today_start_time
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
        actual = GgmDomain::Time.today_start_time
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
        actual = GgmDomain::Time.today_start_time
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
        actual = GgmDomain::Time.today_end_time
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
        actual = GgmDomain::Time.today_end_time
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
        actual = GgmDomain::Time.today_end_time
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
        actual = GgmDomain::Time.display_formated_date_time Time.now
        expected = '2016-11-11 05:00'
        expect(actual).to eq expected
      end
    end
  end

end