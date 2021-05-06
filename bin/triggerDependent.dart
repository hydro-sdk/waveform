import 'package:args/args.dart';
import 'package:hydro_sdk_version/version.dart';
import 'package:waveform/readPackageNameFromPackage.dart';
import 'package:waveform/triggerWorkflow.dart';

void main(List<String> args) async {
  var name = readPackageNameFromPackage();

  var parser = ArgParser();

  parser.addOption("token");
  parser.addOption("repo");
  parser.addOption("ref");
  parser.addOption("version");

  var results = parser.parse(args);

  print(
      "Triggering update workflow to update $name to ${results["version"]} on ${results["repo"]}");

  await triggerWorkflow(
    authToken: results["token"],
    repoName: results["repo"],
    ref: results["ref"],
    dependencyName: name,
    dependencyVersion: Version.parse(results["version"]),
  );
}
