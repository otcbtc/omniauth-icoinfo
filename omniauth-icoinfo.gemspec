# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/icoinfo/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-icoinfo'
  s.version  = OmniAuth::Icoinfo::VERSION
  s.authors  = ['Wayne Chu']
  s.email    = ['wayne@icoinfo.com']
  s.summary  = 'Icoinfo OAuth2 Strategy for OmniAuth'
  s.homepage = 'https://github.com/wayne.5540/omniauth-icoinfo'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
end
