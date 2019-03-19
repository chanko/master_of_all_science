
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "master_of_all_science/version"

Gem::Specification.new do |spec|
  spec.name          = "master_of_all_science"
  spec.version       = MasterOfAllScience::VERSION
  spec.authors       = ["César Camacho"]
  spec.email         = ["chanko@gmail.com"]

  spec.summary       = %q{Gem to wrap MasterOfAllScience.com API}
  spec.homepage      = 'https://github.com/chanko/master_of_all_science'
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency 'pry-byebug', '~> 3.7'
  spec.add_development_dependency 'vcr', '~> 4.0'
  spec.add_development_dependency 'webmock', '~> 3.5'

  spec.add_dependency 'faraday', '~> 0.15'
  spec.add_dependency 'json', '~> 2.2'
  spec.add_dependency 'word_wrap', '~> 1.0'
end
