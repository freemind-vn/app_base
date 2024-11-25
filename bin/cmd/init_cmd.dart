import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:io/io.dart';
import 'package:path/path.dart';

import 'cmd.dart';

class InitCommand extends Command {
  @override
  final name = 'init';

  @override
  final description = 'Setup a new project';

  InitCommand() {
    argParser.addOption(
      'version',
      abbr: 'v',
      help: 'The specific version',
      defaultsTo: 'main',
    );

    argParser.addOption(
      'source',
      abbr: 's',
      help: 'The path of the source code',
    );
  }

  @override
  // [run] may also return a Future.
  void run() async {
    final version = argResults?.option('version');

    final tmpDir = Directory.systemTemp.createTempSync();

    final source = argResults?.option('source');

    // If use the source code path
    if (source != null) {
      await copyPath(source, tmpDir.path);
    } else {
      // Clone the repo
      await execShell(
        'git clone -b $version --depth 1 --progress $gitRepoUrl ${tmpDir.path}',
      );
    }

    // Copy example/Makefile
    final examplePath = Directory(join(tmpDir.path, 'example')).path;
    Future.wait([
      copyFile(join(examplePath, 'Makefile')),
      copyFile(join(examplePath, 'Dockerfile')),
      copyFile(join(examplePath, '.editorconfig')),
      // copyFile(join(examplePath, '.vscode/settings.json'), '.vscode/settings.json'),
    ]);

    // Cleanup
    tmpDir.delete(recursive: true);

    // Install packages
    await execShell('make init');

    // Create index generator
    _createIndexGeneratorConfig();

    // Create widgetbook
    await execShell('flutter create --empty wbook');
    await execShell(
      'dart pub add widgetbook widgetbook_annotation',
      workingDirectory: 'wbook',
    );
    await execShell(
      'dart pub add dev:widgetbook_generator dev:build_runner',
      workingDirectory: 'wbook',
    );
  }

  void _createIndexGeneratorConfig() async {
    final file = File('index_generator.yaml');
    if (!await file.exists()) {
      file.writeAsString(indexGeneratorTpl);
    }
  }
}
