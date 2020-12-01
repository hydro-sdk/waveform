import 'dart:convert';

import 'dart:io';

String readPackageNameFromPackage() {
  var package = json.decode(File("package.json").readAsStringSync());
  return package["name"];
}
