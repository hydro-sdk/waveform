import 'package:args/args.dart';
import 'package:version/version.dart';
import 'package:waveform/installToPackage.dart';
import 'package:waveform/installToPubspec.dart';

void main(List<String> args) async {
  var parser = ArgParser();

  parser.addOption("name");
  parser.addOption("version");

  var results = parser.parse(args);

  String depName = results["name"];
  Version version = Version.parse(results["version"]);

  print("Installing $depName@$version");

  await installToPackage(name: depName, version: version);
  await installToPubspec(name: depName, version: version);
}
