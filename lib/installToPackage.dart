import 'dart:convert';
import 'dart:io';
import 'package:version/version.dart';
import 'package:meta/meta.dart';

Future<void> installToPackage({
  @required String name,
  @required Version version,
}) async {
  Map<String, dynamic> package =
      json.decode(await File("package.json").readAsString());

  package["devDependencies"].removeWhere((k, v) => k == name);
  package["dependencies"][name] = version.toString();

  await File("package.json")
      .writeAsString(JsonEncoder.withIndent("  ").convert(package));
}
