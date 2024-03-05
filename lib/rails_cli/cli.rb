# frozen_string_literal: true

module RailsCLI
  # CLI class
  class CLI
    DATABASES = %w[
      postgresql
      mysql
      sqlite3
      trilogy
      oracle
      sqlserver
      jdbcmysql
      jdbcsqlite3
      jdbcpostgresql
      jdbc
    ].freeze

    JS = %w[
      importmap
      bun
      webpack
      esbuild
      rollup
    ].freeze

    CSS = %w[
      tailwind
      bootstrap
      bulma
      postcss
      sass
    ].freeze

    SKIP_ACTIONS = {
      'action-mailer': 'Skip Action Mailer files',
      'action-mailbox': 'Skip Action Mailbox gem',
      'action-text': 'Skip Action Text gem',
      'active-record': 'Skip Active Record files',
      'active-job': 'Skip Active Job',
      'active-storage': 'Skip Active Storage files',
      'action-cable': 'Skip Action Cable files'
    }.freeze

    def self.start
      new.start
    end

    def start
      ::CLI::UI::Prompt.instructions_color = ::CLI::UI::Color::BLUE
      @app_name = ::CLI::UI.ask('Rails app name:', default: 'my_app')
      @database = select_database
      @js = select_js
      @css = select_css
      @skip_actions = select_skip_actions

      exec(command)
    end

    private

    # @return [String]
    def select_database
      ::CLI::UI::Prompt.ask('Preconfigure for selected database:', options: DATABASES)
    end

    # @return [String]
    def select_js
      ::CLI::UI::Prompt.ask('Choose JavaScript approach:', options: JS)
    end

    # @return [String]
    def select_css
      ::CLI::UI::Prompt.ask('Choose CSS processor:', options: CSS)
    end

    # @return [Array<String>]
    def select_skip_actions
      ::CLI::UI::Prompt.ask('Skip selected', multiple: true) do |handler|
        SKIP_ACTIONS.each do |key, value|
          handler.option(value) { key }
        end
      end
    end

    # @return [String]
    def command
      "bundle exec rails new #{@app_name} --database=#{@database} --javascript=#{@js} #{skiped_actions} --skip-bundle"
    end

    # @return [String]
    def skiped_actions
      @skip_actions.map { |key| "--skip-#{key}" }.join(' ')
    end
  end
end
