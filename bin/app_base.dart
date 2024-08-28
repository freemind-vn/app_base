import 'package:args/command_runner.dart';

import 'cmd/init_cmd.dart';

void main(List<String> args) {
  CommandRunner('app_base', "A Freemind's simple app template")
    ..addCommand(InitCommand())
    ..run(args);
}
