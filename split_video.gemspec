# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'split_video/version'

Gem::Specification.new do |spec|
  spec.name          = "split_video"
  spec.version       = SplitVideo::VERSION
  spec.authors       = ["max thom stahl"]
  spec.email         = ["max@villainousindustries.com"]
  spec.summary       = %q{Use the magic of FFmpeg to split videos with the greatest of ease}
  spec.description   = %q{Split video files without transcoding them using FFmpeg}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
