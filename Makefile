SHELL = /bin/bash

prefix ?= /usr/local
bindir ?= $(prefix)/bin
libdir ?= $(prefix)/lib
srcdir = Sources

REPODIR = $(shell pwd)
BUILDDIR = $(REPODIR)/cli

.DEFAULT_GOAL = all

.PHONY: install
install:
	@install -d "$(bindir)"
	@install "$(BUILDDIR)/macos/onepile" "$(bindir)"

.PHONY: uninstall
uninstall:
	@rm -rf "$(bindir)/onepile"
