# frozen_string_literal: true

require 'cli/ui'

# Base module for the Rails CLI gem
module RailsCLI
  autoload :CLI, 'rails_cli/cli'

  def self.start
    CLI.start
  end
end
