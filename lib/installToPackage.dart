import 'dart:convert';
import 'dart:io';

//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';

Future<void> installToPackage({
  required String name,
  required Version version,
}) async {
  Map<String, dynamic> package =
      json.decode(await File("package.json").readAsString());

  package["devDependencies"]?.removeWhere((k, v) => k == name);
  package["dependencies"][name] = version.toString();

  await File("package.json")
      .writeAsString(JsonEncoder.withIndent("  ").convert(package));
}
