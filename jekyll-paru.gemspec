# frozen_string_literal: true

require_relative "lib/jekyll-paru/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-paru"
  spec.version = Jekyll::Paru::VERSION
  spec.authors = ["Ulysses Zhan"]
  spec.email = ["ulysseszhan@gmail.com"]

  spec.summary = "Jekyll Markdown converter using Paru"
  spec.description = "Jekyll Markdown converter using Paru."
  spec.homepage = "https://github.com/UlyssesZh/jekyll-paru"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/UlyssesZh/jekyll-paru"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  s.add_dependency "jekyll", '>= 3.0'
  s.add_dependency "paru", '>= 1.1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
