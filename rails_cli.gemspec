# frozen_string_literal: true

require_relative 'lib/rails_cli/version'

Gem::Specification.new do |spec|
  spec.name = 'rails_cli'
  spec.version = RailsCLI::VERSION
  spec.authors = ['Alex Merkulov']
  spec.email = ['rormercury@gmail.com']

  spec.summary = 'Rails CLI gem simplifies the initiation of Rails projects.'
  spec.description = <<-TEXT.strip
    Rails CLI gem simplifies the initiation of Rails projects by offering a guided interface for
    selecting configurations, making it a must-have tool for junior developers and rapid project prototyping.
  TEXT
  spec.homepage = 'https://github.com/bf-rb/rails_cli'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'changelog_uri' => 'https://github.com/bf-rb/rails_cli/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/bf-rb/rails_cli',
    'bug_tracker_uri' => 'https://github.com/bf-rb/rails_cli/issues',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = %w[README.md LICENSE.txt]
  spec.files += Dir['lib/**/*.rb']
  spec.require_paths = ['lib']
  spec.bindir = 'exe'
  spec.executables = %w[rails_cli rails-cli]

  spec.add_dependency 'cli-ui', '>= 2.2.3'

  spec.add_runtime_dependency 'rails', '>= 7.0'
end
