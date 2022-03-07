#
# Copyright (C) 2012
#     Charles Roussel <charles.roussel@ensimag.imag.fr>
#     Simon Cathebras <simon.cathebras@ensimag.imag.fr>
#     Julien Khayat <julien.khayat@ensimag.imag.fr>
#     Guillaume Sasdy <guillaume.sasdy@ensimag.imag.fr>
#     Simon Perrat <simon.perrat@ensimag.imag.fr>
#
## Test git-remote-mediawiki

SHELL=/bin/bash

# Do not modify these! Modify test.config instead
export WIKI_DIR_NAME ?=
export WIKI_ADMIN ?=
export WIKI_PASSW ?=
export SERVER_ADDR ?=
export WIKI_DIR_INST ?=
export PORT ?=
export FILES_FOLDER ?=
export DB_FILE ?=
export DB_PRISTINE ?=
export LIGHTTPD ?=
export PHP_DIR ?=
export LIGHTTPD_DIR ?=
export WEB ?=
export WEB_TMP ?=
export WEB_WWW ?=

include test.config

all: test

T = $(wildcard t[0-9][0-9][0-9][0-9]-*.sh)

.PHONY: help test clean all install-wiki

help:
	@echo 'Run "$(MAKE) test" to launch test scripts'
	@echo 'Run "$(MAKE) clean" to remove trash folders'

test:
	@for t in $(T); do \
		echo "$$t"; \
		"./$$t" --verbose || exit 1; \
	done

clean:
	$(RM) -r 'trash directory'.*
