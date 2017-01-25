module GgmDomain
  module Browser
    require 'woothee'

    def self.what_is_os_name(ua)
      Woothee.parse(ua)[:os]
    end

    def self.is_ios?(ua)
      %w(iPhone iPad iPod).include? what_is_os_name(ua)
    end

    def self.is_android?(ua)
      what_is_os_name(ua) == 'Android'
    end

    def self.is_pc?(ua)
      !is_ios?(ua) and !is_android?(ua)
    end

    def self.android_device_name(ua)
      return nil unless is_android?(ua)
      device_data = Woothee.parse(ua)
      os_str = "#{device_data[:os]} #{device_data[:os_version]};"
      start_index = ua.index(os_str)
      return nil if start_index == nil
      start_index = start_index + os_str.length
      end_index = ua.index 'Build'
      return nil if end_index == nil
      ua.slice(start_index, end_index - start_index).strip
    end

  end
end