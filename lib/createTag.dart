import 'dart:io';

import 'package:meta/meta.dart';
import 'package:version/version.dart';

Future<void> createTag({@required Version version}) async {
  await Process.run("npm", ["version", version.toString()]).then((process) {
    print(process.stdout);
    print(process.stderr);
  });
}
