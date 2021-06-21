import 'dart:io';

//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';

void writeChangelog({
  required Version version,
}) =>
    File("CHANGELOG.md").writeAsStringSync("## [${version.toString()}]\n");
