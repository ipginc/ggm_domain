module GgmDomain
  module Browser
    require 'woothee'

    class << self
      def what_is_os_name(ua)
        Woothee.parse(ua)[:os]
      end

      def is_ios?(ua)
        %w(iPhone iPad iPod).include? what_is_os_name(ua)
      end

      def is_android?(ua)
        what_is_os_name(ua) == 'Android'
      end

      def is_pc?(ua)
        !is_ios?(ua) and !is_android?(ua)
      end

      def android_device_name(ua)
        return nil unless is_android?(ua)
        device_data = Woothee.parse(ua)
        os_str = "#{device_data[:os]} #{device_data[:os_version]};"
        start_index = ua.index(os_str)
        if device_data[:os_version] == 'UNKNOWN'
          ua_slice = ua.slice(0,ua.index('Build'))
          start_index = ua_slice.rindex(';') + 1
        end
        return nil if start_index == nil
        if device_data[:os_version] != 'UNKNOWN'
          start_index = start_index + os_str.length
        end
        end_index = ua.index 'Build'
        return nil if end_index == nil
        device_name = ua.slice(start_index, end_index - start_index).strip
        pos = device_name.index ';'
        if pos.nil?
          device_name
        else
          device_name.slice(pos + 1, device_name.length - pos).strip
        end
      end

      def is_ggm?(ua)
        ua.match /GGM$/
      end

      def is_crawler?(ua)
        Woothee.is_crawler(ua)
      end

    end

    class AccessInfo
      attr_reader :ua
      attr_reader :device
      attr_reader :os

      def initialize(ua)
        @ua = ua
        @os = Browser.what_is_os_name @ua
        if Browser.is_android?(ua)
          @device = Browser.android_device_name @ua
        else
          @device = @os
        end
      end

      def is_ios?
        Browser.is_ios? ua
      end

      def is_android?
        Browser.is_android? ua
      end

      def is_pc?
        Browser.is_pc? ua
      end

      def is_ggm?
        Browser.is_ggm? ua
      end
    end

  end
end