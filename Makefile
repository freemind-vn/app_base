.PHONY: build test

# Environments
-include .env

define get_pubspec
$(shell yq -r ".$1" pubspec.yaml)
endef

#: list all targets
help:
	@grep -B1 -E "^[a-zA-Z0-9_%-]+:([^\=]|$$)" Makefile \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
		| column -t -s '###'

#: remove untracked files from the working tree
clean:
#	git clean -fdx
	flutter clean

# -----------------------------------------------------------------------------
# Flutter
# -----------------------------------------------------------------------------

#: install necessary packages
init:
	dart pub global activate dartdoc
	dart pub global activate index_generator
	dart pub global activate import_sorter

#: code formatting
fmt:
	dart pub global run index_generator
	dart pub global run import_sorter:main --no-comments
	dart fix --apply
	dart format --fix lib/src/

#: analyzes the project's Dart source code
lint:
	dart analyze lib/src/

#: download arb files from the Weblate
text:
	curl -Lo assets/l10n/en.arb https://weblate.freemind.vn/download/app-base/glossary/en/
	curl -Lo assets/l10n/vi.arb https://weblate.freemind.vn/download/app-base/glossary/vi/

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
	flutter test --coverage  --coverage-path test/lcov.info $(F_FLAGS)

#: build the package
publish:
	flutter pub publish --dry-run

# -----------------------------------------------------------------------------
# Example
# -----------------------------------------------------------------------------

#: run your Flutter app on $(PLATFORM)
run:
	cd example; make run;

#: start DevTools
dev:
	cd example; make dev;
