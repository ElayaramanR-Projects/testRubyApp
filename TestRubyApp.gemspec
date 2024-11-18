require_relative 'lib/TestRubyApp/version'

Gem::Specification.new do |spec|
  spec.name          = "TestRubyApp"
  spec.version       = TestRubyApp::VERSION
  spec.authors       = ["Elayaraman"]
  spec.email         = ["elayaraman007@gmail.com"]

  spec.summary       = 'A test Ruby app'
  spec.description   = A longer description of your test Ruby app'
  spec.homepage      = "https://github.com/ElayaramanR-Projects/testRubyApp"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ElayaramanR-Projects/testRubyApp"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
