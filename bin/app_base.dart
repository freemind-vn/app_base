import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';

const gitRepoUrl = 'git@gitlab.com:free-mind/woocommerce/app.git';

void main(List<String> args) {
  final runner = CommandRunner('app_base', "A Freemind's simple app template")
    ..addCommand(CreateCommand())
    ..addCommand(UpdateCommand())
    ..run(args);

  runner.run(args);
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
    // print(argResults.toString());

    stdout.writeln('Download the version: xyz');
    // Process.run('git', ['clone', gitRepoUrl, '']);
    final p = await Process.start('ls', ['~']);
    p.stdout.transform(utf8.decoder).forEach(print);
  }
}

class UpdateCommand extends Command {
  @override
  final name = 'update';
  @override
  final description = 'Update the existing project';

  UpdateCommand();

  @override
  void run() {}
}
