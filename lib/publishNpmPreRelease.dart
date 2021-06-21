import 'dart:convert';
import 'dart:io';

//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';
//ignore: import_of_legacy_library_into_null_safe
import 'package:yaml_modify/yaml_modify.dart';

Future<void> publishNpmPreRelease({
  required Version version,
}) async {
  var package = json.decode(File("package.json").readAsStringSync());
  package["version"] = version.toString();

  File("package.json").writeAsStringSync(json.encode(package));

  var pubspec =
      getModifiableNode(loadYaml(await File("pubspec.yaml").readAsString()));
  pubspec["version"] = version.toString();
  await File("pubspec.yaml").writeAsString(
      toYamlString(pubspec).replaceAll("sdk: \"flutter\"", "sdk: flutter"));

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
