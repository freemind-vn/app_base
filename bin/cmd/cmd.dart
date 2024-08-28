import 'dart:io';

import 'package:path/path.dart';

const gitRepoUrl = 'https://github.com/freemind-vn/app_base.git';

// Index generator file config
const indexGeneratorTpl = '''
index_generator:
  exclude:
    - "**.g.dart"
  indexes:
    - path: lib
      include: [src/*.dart]
      name: app
''';

Future<void> execShell(
  String cmd, {
  String shell = 'sh',
  String? workingDirectory,
}) async {
  final process = await Process.start(
    shell,
    ['-c', cmd],
    workingDirectory: workingDirectory,
  );
  await stdout.addStream(process.stdout);
  await stdout.addStream(process.stderr);
}

Future<File> copyFile(String src, [String? dest]) async {
  final file = File(src);
  dest = dest ?? basename(src);
  return file.copy(dest);
}
