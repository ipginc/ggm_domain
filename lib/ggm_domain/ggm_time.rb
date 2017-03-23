module GgmDomain
  require 'active_support/all'
  module GgmTime
    class << self
      START_TIME = 5.freeze
      DURATION = 24.freeze

      def broad_cast_date(target_date_str)
        (DateTime.parse(target_date_str) - 5.hour).strftime '%Y%m%d'
      end

      def today_start_time(current_time = DateTime.current)
        now_ymd_date = DateTime.parse current_time.strftime '%Y%m%d'
        (current_time.strftime('%H').to_i >= 5 ? now_ymd_date : now_ymd_date.yesterday) + 5.hour
      end

      def today_end_time(current_time = DateTime.current)
        now_ymd_date = DateTime.parse current_time.strftime '%Y%m%d'
        (current_time.strftime('%H').to_i >= 5 ? now_ymd_date.tomorrow : now_ymd_date) + 5.hour - 1.minutes
      end

      def display_formated_date_time(date_time)
        date_time.strftime('%Y-%m-%d %H:%M')
      end

      def program_start_time(day)
        Time.strptime(day, '%Y%m%d') + START_TIME * 1.hour
      end

      def calc_epg_term(broad_cast_date)
        start_time = program_start_time broad_cast_date
        end_time = start_time + DURATION * 1.hour
        return start_time, end_time
      end

      def program_switch_time(day_time)
        target_day_time = day_time.hour.between?(5, 23) ? (day_time + 1.days) : day_time
        Time.mktime(target_day_time.year, target_day_time.month, target_day_time.day, 4, 59, 59)
      end

    end
  end
end