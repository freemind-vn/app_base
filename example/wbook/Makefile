
#: code formatting
fmt:
#	dart pub global run index_generator
	dart pub global run import_sorter:main --no-comments
	dart fix --apply
	dart format --fix lib/

#: analyzes the project's Dart source code
lint:
	dart analyze lib/

gen:
	dart run build_runner watch -d

run:
#	flutter run -d web-server
	flutter run
