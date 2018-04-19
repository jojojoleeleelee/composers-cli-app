
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "composers/version"

Gem::Specification.new do |spec|
  spec.name          = "composers"
  spec.version       = Composers::VERSION
  spec.authors       = ["'Joanne Lee'"]
  spec.email         = ["'vernapii@gmail.com'"]

  spec.summary       = "Do you like Classical music? Are you into composers? Well then, this gem is for you!"
  spec.description   = "This is a CLI app that outputs your choice of classical composer you would like to learn more about. Grouped alphabetically, this app will output your choice of composer's biography, years of life, major works and url resource if you'd like to learn more"
  spec.homepage      = "https://github.com/jojojoleeleelee/composers-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.com'
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.6.8"
  spec.add_development_dependency "pry"
end
