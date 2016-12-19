module GgmDomain
  module Image
    BASE = 'https://img.bangumi.org/'.freeze

    def self.cdn_path(url)
      url ? url.gsub(/^http:\/\/([0-9a-zA-Z\.\-:]+?):?[0-9]*?\//i, BASE) : nil
    end

  end
end