# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra_cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-cmd"
  spec.version       = SinatraCmd::VERSION
  spec.authors       = ["CBluowei"]
  spec.email         = ["wei.luo@careerbuilder.com"]

  spec.summary       = %q{Command for generating sinatra project}
  spec.description   = %q{Generate a sinatra project.}
  spec.homepage      = "https://github.com/hilotus/sinatra-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "thor", "~> 0.19"
end
