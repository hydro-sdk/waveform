import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:version/version.dart';

Future<void> publishPreRelease({@required Version version}) async {
  var package = json.decode(File("package.json").readAsStringSync());
  package["version"] = version.toString();

  File("package.json").writeAsStringSync(json.encode(package));

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
