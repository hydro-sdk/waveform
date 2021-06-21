import 'package:args/args.dart';
//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';
import 'package:waveform/flutterPubGet.dart';
import 'package:waveform/installToPackage.dart';
import 'package:waveform/installToPubspec.dart';
import 'package:waveform/npmInstall.dart';

void main(List<String> args) async {
  var parser = ArgParser();

  parser.addOption("name");
  parser.addOption("version");

  var results = parser.parse(args);

  String depName = results["name"];
  Version version = Version.parse(results["version"]);

  print("Installing $depName@$version");

  await installToPackage(name: depName, version: version);
  await npmInstall();
  await installToPubspec(name: depName, version: version);
  await flutterPubGet();
}
