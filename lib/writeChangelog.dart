import 'dart:io';

import 'package:hydro_sdk_version/version.dart';
import 'package:meta/meta.dart';

void writeChangelog({@required Version version}) =>
    File("CHANGELOG.md").writeAsStringSync("## [${version.toString()}]\n");
