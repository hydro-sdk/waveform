import 'dart:io';

import 'package:meta/meta.dart';

Future<bool> checksPassing({@required String prNum}) async {
  var proc = await Process.run("gh", ["pr", "check", prNum]);

  if (proc.stderr != null) {
    print(proc.stderr);
  }

  if (proc.exitCode != 0) {
    throw proc.exitCode;
  }

  return RegExp("All checks were successful").hasMatch((proc.stdout as String));
}
