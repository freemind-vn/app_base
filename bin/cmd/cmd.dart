import 'dart:io';

import 'package:path/path.dart';

Future<void> execShell(String cmd, [String shell = 'sh']) async {
  final process = await Process.start(shell, ['-c', cmd]);
  await stdout.addStream(process.stdout);
  await stdout.addStream(process.stderr);
}

Future<File> copyFile(String src, [String? dest]) async {
  final file = File(src);
  dest = dest ?? basename(src);
  return file.copy(dest);
}
