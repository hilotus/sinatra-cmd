# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-cmd"
  spec.version       = Sinatra::Cmd::VERSION
  spec.authors       = ["CBluowei"]
  spec.email         = ["wei.luo@careerbuilder.com"]

  spec.summary       = %q{A CLI of generate sinatra project.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/hilotus/sinatra-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "thor", "~> 0.19"
end
