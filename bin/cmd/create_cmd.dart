import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:path/path.dart';

import 'cmd.dart';

const gitRepoUrl = 'https://github.com/freemind-vn/app_base.git';

// Index generator file config
const indexGenerator = '''
index_generator:
  exclude:
    - "**.g.dart"
  indexes:
    - path: lib
      include: [src/*.dart]
      name: app
''';

class CreateCommand extends Command {
  @override
  final name = 'create';

  @override
  final description = 'Create a new project';

  CreateCommand() {
    argParser.addOption(
      'version',
      abbr: 'v',
      help: 'The specific version',
      defaultsTo: 'main',
    );
  }

  @override
  // [run] may also return a Future.
  void run() async {
    final version = argResults?.option('version');
    // Clone the repo
    final tmpDir = Directory.systemTemp.createTempSync();
    await execShell(
        'git clone -b $version --depth 1 --progress $gitRepoUrl ${tmpDir.path}');

    // Copy example/Makefile
    final examplePath = Directory(join(tmpDir.path, 'example')).path;
    Future.wait([
      copyFile(join(examplePath, 'Makefile')),
      copyFile(join(examplePath, 'Dockerfile')),
      // copyFile(join(examplePath, '.vscode/settings.json'), '.vscode/settings.json'),
    ]);

    // Cleanup
    tmpDir.delete(recursive: true);

    // Install packages
    await execShell('make init');

    // Create index generator
    _createIndexGeneratorConfig();

    // Create widgetbook
    await execShell('flutter create --empty widgetbook');
    await execShell('flutter pub add widgetbook widgetbook_annotation');
    await execShell(
        'flutter pub add dev:widgetbook_generator dev:build_runner');
  }

  void _createIndexGeneratorConfig() async {
    final file = File('index_generator.yaml');
    if (!await file.exists()) {
      file.writeAsString(indexGenerator);
    }
  }
}
