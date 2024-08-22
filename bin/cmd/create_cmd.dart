import 'dart:io';

import 'package:args/command_runner.dart';

const gitRepoUrl = 'https://github.com/freemind-vn/app_base.git';
const tag = 'dev';

class CreateCommand extends Command {
  @override
  final name = 'create';

  @override
  final description = 'Create a new project';

  CreateCommand() {
    argParser.addFlag('version', abbr: 'v', help: 'The specific version');
  }

  @override
  // [run] may also return a Future.
  void run() async {
    var tmp = Directory.systemTemp.createTempSync().path;
    Process.runSync(
        'git', ['clone', gitRepoUrl, '-b', tag, '--depth', '1', tmp]);
    Process.runSync('rm', ['-rf', '$tmp/.git']);

    // Create the dest
    final args = argResults?.arguments ?? [];
    final dest = args.isNotEmpty ? args[0] : '.';
    Process.runSync('mv', ['$tmp/example', dest]);
    stdout.writeln('A new app has been created at $dest');
  }
}
