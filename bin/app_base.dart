import 'package:args/command_runner.dart';

import 'cmd/create_cmd.dart';
import 'cmd/update_cmd.dart';

void main(List<String> args) {
  CommandRunner('app_base', "A Freemind's simple app template")
    ..addCommand(CreateCommand())
    ..addCommand(UpdateCommand())
    ..run(args);
}
