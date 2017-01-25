module GgmDomain
  module Time
    require 'active_support/all'

    def self.broad_cast_date(target_date_str)
      (DateTime.parse(target_date_str) - 5.hour).strftime '%Y%m%d'
    end

    def self.today_start_time(current_time = DateTime.current)
      now_ymd_date = DateTime.parse current_time.strftime '%Y%m%d'
      (current_time.strftime('%H').to_i >= 5 ? now_ymd_date : now_ymd_date.yesterday) + 5.hour
    end

    def self.today_end_time(current_time = DateTime.current)
      now_ymd_date = DateTime.parse current_time.strftime '%Y%m%d'
      (current_time.strftime('%H').to_i >= 5 ? now_ymd_date.tomorrow : now_ymd_date) + 5.hour - 1.minutes
    end

    def self.display_formated_date_time(date_time)
      date_time.strftime('%Y-%m-%d %H:%M')
    end

  end
end