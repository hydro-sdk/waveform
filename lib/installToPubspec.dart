import 'dart:io';
//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';
import 'package:yaml/yaml.dart';
//ignore: import_of_legacy_library_into_null_safe
import 'package:waveform/yaml_modify/yaml_writer.dart';

Future<void> installToPubspec({
  required String name,
  required Version version,
}) async {
  print("installToPubspec");
  final pubspec =
      getModifiableNode(loadYaml(await File("pubspec.yaml").readAsString()));

  print("Modifying \"$name\" in pubspec.yaml");

  if (!RegExp("waveform").hasMatch(name)) {
    pubspec["dependencies"]
        [name.split("/").elementAt(1).replaceAll("-", "_")] = {
      "git": {
        "url": "git://github.com/${name.replaceAll("@", "")}.git",
        "ref": version.toString(),
      }
    };
  } else {
    pubspec["dependencies"]["waveform"] = version.toString();
  }

  await File("pubspec.yaml").writeAsString(
      toYamlString(pubspec).replaceAll("sdk: \"flutter\"", "sdk: flutter"));
}
