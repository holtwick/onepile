# This is pretty much the result of https://nshipster.com/homebrew/
# Install like this: brew install holtwick/formulae/onepile

SHELL = /bin/bash

prefix ?= /usr/local
bindir ?= $(prefix)/bin
libdir ?= $(prefix)/lib
srcdir = Sources

REPODIR = $(shell pwd)
BUILDDIR = $(REPODIR)/cli

install:
	@install -d "$(bindir)"
	@install "$(BUILDDIR)/macos/onepile" "$(bindir)"

uninstall:
	@rm -rf "$(bindir)/onepile"
