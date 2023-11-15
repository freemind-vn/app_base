.PHONY: doc test build

# Environments
-include .env

define get_pubspec
	$(shell yq -r ".$1" pubspec.yaml)
endef

# Service
NAME			= $(call get_pubspec,name)
VERSION			= $(call get_pubspec,version)
DESCRIPTION		= $(call get_pubspec,description)

# Default target
PLATFORM		?= $(shell uname | tr A-Z a-z)

ifeq ($(PLATFORM), darwin)
	PLATFORM	= macos
endif

# Flutter build flags
SERVICE_HOST	?= happymind.freemind.vn
SERVICE_PORT	?= 443

F_FLAGS			?= --dart-define=SERVICE_HOST=$(SERVICE_HOST) \
	--dart-define SERVICE_PORT=$(SERVICE_PORT) \
	--dart-define VERSION='$(VERSION)' \
	--dart-define BRANCH=$(shell git rev-parse --abbrev-ref HEAD) \
	--dart-define HASH=$(shell git rev-parse --short HEAD)

#: list all targets
help:
	@grep -B1 -E "^[a-zA-Z0-9_%-]+\:([^\=]|$$)" Makefile \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
		| column -t -s '###'

#: remove untracked files from the working tree
clean:
#	git clean -fdx
	flutter clean

#: install necessary packages
init:
	dart pub global activate dartdoc
	dart pub global activate index_generator
	dart pub global activate arb_excel
	dart pub global activate import_sorter
	dart pub global activate protoc_plugin
	dart pub global activate flutterfire_cli

#: automatically generate index / barrel files with all the exports needed for your library.
index:
	dart pub global run index_generator

#: code formatting
fmt:
	dart pub global run import_sorter:main --no-comments
	dart fix --apply
	dart format --fix lib/src/

#: analyzes the project's Dart source code
lint:
	dart analyze lib/src/

#: generate l10n from 'assets/l10n/app.xlsx'
text:
	curl -Lo assets/l10n/app.xlsx 'https://onedrive.live.com/download?cid=681330426B4177E7&resid=681330426B4177E7%21116603&authkey=AEteDTs04X0cW9U&em=2'
	dart pub global run arb_excel -a assets/l10n/app.xlsx

#: creates API reference documentation from Dart source code
doc:
	@echo "• $(shell git rev-parse --short HEAD)-$(shell git rev-parse --abbrev-ref HEAD) • $(shell date "+%Y-%m-%d %H:%M")" > doc/api/footer
	dart doc

	@sed -i 's/<title>app - Dart API docs<\/title>/<title>$(NAME)<\/title>/' doc/api/index.html
	@sed -i 's/app package/Game Dashboard/' doc/api/index.html
	@sed -i 's/>app</>Game Dashboard</' doc/api/index.html
	@sed -En 's/<span class="no-break">.*<\/span>/<span class="no-break">Game Dasboard • $(gitCommit) • $(gitBranch) <\/span>/' doc/api/index.html

#: flutter test
test:
	flutter test --coverage  --coverage-path test/lcov.info

#: run your Flutter app on $(PLATFORM)
run:
	flutter run -d $(PLATFORM) $(F_FLAGS)

#: start DevTools 
dev:
	dart devtools

#: Build your Flutter app on $(PLATFORM)
build:
	@echo Build for $(PLATFORM)
	@make -s build-$(PLATFORM)

#: Run your Flutter on a platform: web, windows, linux, macos, android, ios
run-%:
	@echo "Building on: $*"
	flutter run -d $* $(F_FLAGS)

#: Build your Flutter app on a platform: web, windows, linux, macos, apk, appbundle, ios, ipa
build-%:
	@echo "Building on: $*"
	@if [ "$*" = "web" ]; then \
		flutter build web --release --web-renderer html $(F_FLAGS) $(args); \
	else \
		flutter build  $* --obfuscate --split-debug-info=. $(F_FLAGS) $(args); \
	fi
