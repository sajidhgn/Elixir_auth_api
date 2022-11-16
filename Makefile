#!make
include .env
.PHONY: help console outdated setup server test test-clear update-mix check iex

HELP_PADDING = 20

help: ## Shows this help.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-$(HELP_PADDING)s %s\n" $$help_command $$help_info ; \
	done

.env:
	cp .env

console: ## Opens the App console.
	iex -S mix

outdated: ## Shows outdated packages.
	mix hex.outdated

deps: mix.lock
	mix deps.get

setup: deps
setup: ## Setup the App.
	mix deps.unlock --unused
	mix compile
	mix ecto.setup

server: setup
server:
	echo export
	mix phx.swagger.generate
	iex -S mix phx.server

update-mix: ## Update mix packages.
	mix deps.update --all

rollback:
	mix ecto.rollback && MIX_ENV=test mix ecto.rollback

migrate:
	mix ecto.migrate && MIX_ENV=test mix ecto.migrate

check:
	mix format
	MIX_ENV=test mix credo
	mix dialyzer

iex: setup
	iex -S mix phx.server
