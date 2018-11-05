
# ###########
# Global Vars

APP_NAME ?= statuscake-exporter

DOCKER_REPO 		?= mtulio
DOCKER_IMAGE_NAME 	= $(APP_NAME)
DOCKER_IMAGE_TAG 	?= $(subst /,-,$(shell git rev-parse --abbrev-ref HEAD))

CPWD := $(PWD)

TMP_DIRS := ./bin
TMP_DIRS += ./dist

GORELEASE_VERSION 	:= v0.86.1
GORELEASE_BASE_URL 	:= https://github.com/goreleaser/goreleaser/releases/download/$(GORELEASE_VERSION)/goreleaser
GORELEASE_URL_RPM 	:= $(GORELEASE_BASE_URL)_amd64.rpm

# ##################
# Makefile functions

define deps_tag
	# @if [[ $(version)x == "x" ]]; then \
	# 	echo -e "\n Error: the version was not specified."; \
	# 	$(call show_usage) \
	# 	exit 1; \
	# fi
	@if [[ "$(message)"x == "x" ]]; then \
		echo -e "\n Error: the commit message was not provided."; \
		$(call show_usage) \
		exit 1; \
	fi
endef