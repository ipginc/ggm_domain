# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ggm_domain/version'

Gem::Specification.new do |spec|
  spec.name          = "ggm_domain"
  spec.version       = GgmDomain::VERSION
  spec.authors       = ["ipgdeveloper"]
  spec.email         = ["jenkins@ipg.co.jp"]

  spec.summary       = %q{ggmのドメイン情報をまとめたモジュール}
  spec.description   = %q{ggmのドメイン情報をまとめたモジュール}
  spec.homepage      = "https://github.com/ipginc/ggm_domain.git"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"
  spec.add_dependency "virtus"
  spec.add_dependency "activesupport"
  spec.add_dependency "woothee"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
end
