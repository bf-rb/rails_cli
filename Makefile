.PHONY: demo build
.SILENT: demo build

GEM_VERSION := $(shell ruby -r ./lib/rails_cli/version.rb -e 'puts RailsCLI::VERSION')

GEM_HOST_API_KEY := $(shell cat ./rubygems_api.key)

# Run demo
demo:
	cd ./demo && bundle install && bundle exec rails-cli

# Build gem
build:
	gem build rails_cli.gemspec

push:
	export GEM_HOST_API_KEY=$(GEM_HOST_API_KEY) && gem push rails_cli-$(GEM_VERSION).gem

release: build push
