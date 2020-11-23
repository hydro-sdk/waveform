import 'dart:io';

import 'package:meta/meta.dart';
import 'package:version/version.dart';

Future<void> publishPreRelease({@required Version version}) async {
  await Process.run("npm", [
    "publish",
    "--tag",
    version.leadingPreRelease(),
    "--access",
    "public"
  ]).then((process) {
    print(process.stdout);
    print(process.stderr);
  });
}
