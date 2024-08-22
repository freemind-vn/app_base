import 'package:args/command_runner.dart';

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
