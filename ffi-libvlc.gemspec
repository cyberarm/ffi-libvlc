require_relative "lib/ffi-libvlc/version"

Gem::Specification.new do |spec|
  spec.name          = "ffi-libvlc"
  spec.version       = LibVLC::VERSION
  spec.authors       = ["Cyberarm"]
  spec.email         = ["matthewlikesrobots@gmail.com"]

  spec.summary       = %q{ Ruby bindings for LibVLC }
  spec.description   = %q{ Ruby bindings for LibVLC using FFI }
  spec.homepage      = "https://github.com/cyberarm/ffi-libvlc"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.add_dependency "ffi", "~> 1.2"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "minitest", "~> 5.14"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
