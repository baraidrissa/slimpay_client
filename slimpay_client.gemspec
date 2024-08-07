# frozen_string_literal: true

require_relative "lib/slimpay_client/version"

Gem::Specification.new do |spec|
  spec.name = "slimpay_client"
  spec.version = SlimpayClient::VERSION
  spec.authors = ["Idrissa Bara"]
  spec.email = ["bara.idris@gmail.com"]

  spec.summary = "Slimpay Client for Ruby."
  spec.description = "Ruby library for Slimpay's API."
  spec.homepage = "https://github.com/baraidrissa/slimpay_client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/baraidrissa/slimpay_client"
  spec.metadata["changelog_uri"] = "https://github.com/baraidrissa/slimpay_client/CHANGELOG.md"

  spec.post_install_message = %(Please refer to Slimpay's API https://dev.slimpay.com for more informations.)

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'httparty', '~> 0.22.0'
  spec.add_dependency 'oauth2', '~> 2.0', '>= 2.0.9'

  spec.add_development_dependency 'bundler', '~> 2.5', '>= 2.5.17'
  spec.add_development_dependency 'rake', '~> 13.2', '>= 13.2.1'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'rubocop', '~> 1.65', '>= 1.65.1'
  spec.add_development_dependency 'vcr', '~> 6.2'
  spec.add_development_dependency 'webmock', '~> 3.23', '>= 3.23.1'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
