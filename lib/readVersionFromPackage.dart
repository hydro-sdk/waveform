import 'dart:convert';

import 'dart:io';

String readVersionFromPackage() {
  var package = json.decode(File("package.json").readAsStringSync());
  return package["version"];
}
