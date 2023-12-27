import 'dart:io';

import 'package:args/command_runner.dart';

const gitRepoUrl = 'git@gitlab.com:free-mind/woocommerce/app.git';
const tag = 'template';

void main(List<String> args) {
  CommandRunner('app_base', "A Freemind's simple app template")
    ..addCommand(CreateCommand())
    ..addCommand(UpdateCommand())
    ..run(args);
}

class CreateCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  @override
  final name = 'create';

  @override
  final description = 'Create a new project';

  CreateCommand() {
    // we can add command specific arguments here.
    // [argParser] is automatically created by the parent class.
    argParser.addFlag('version', abbr: 'v', help: 'The specific version');
  }

  @override
  // [run] may also return a Future.
  void run() async {
    // [argResults] is set before [run()] is called and contains the flags/options
    // passed to this command.

    var tmp = Directory.systemTemp.createTempSync().path;
    Process.runSync(
        'git', ['clone', gitRepoUrl, '-b', tag, '--depth', '1', tmp]);
    Process.runSync('rm', ['-rf', '$tmp/.git']);

    // Create the dest
    final args = argResults?.arguments ?? [];
    final dest = args.isNotEmpty ? args[0] : '.';
    Process.runSync('mv', ['$tmp/example', dest]);
    stdout.writeln('Project has been created at=$dest');
  }
}

class UpdateCommand extends Command {
  @override
  final name = 'update';

  @override
  final description = 'Update the existing project';

  UpdateCommand();

  @override
  void run() {
    throw UnimplementedError;
  }
}
