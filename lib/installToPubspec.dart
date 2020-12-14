import 'dart:io';
import 'package:version/version.dart';
import 'package:meta/meta.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_modify/yaml_modify.dart';

Future<void> installToPubspec({
  @required String name,
  @required Version version,
}) async {
  final pubspec =
      getModifiableNode(loadYaml(await File("pubspec.yaml").readAsString()));

  pubspec["dependencies"][name.split("/").elementAt(1).replaceAll("-", "_")] = {
    "git": {
      "url": "git://github.com/${name.replaceAll("@", "")}.git",
      "ref": version.toString(),
    }
  };

  await File("pubspec.yaml").writeAsString(
      toYamlString(pubspec).replaceAll("sdk: \"flutter\"", "sdk: flutter"));
}
