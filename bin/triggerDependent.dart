import 'package:args/args.dart';
import 'package:version/version.dart';
import 'package:waveform/readPackageNameFromPackage.dart';
import 'package:waveform/readVersionFromPackage.dart';
import 'package:waveform/triggerWorkflow.dart';

void main(List<String> args) async {
  var version = Version.parse(readVersionFromPackage());
  var name = readPackageNameFromPackage();

  var parser = ArgParser();

  parser.addOption("token");
  parser.addOption("repo");
  parser.addOption("ref");

  var results = parser.parse(args);

  print(
      "Triggering update workflow to update $name to $version on ${results["repo"]}");

  await triggerWorkflow(
    authToken: results["token"],
    repoName: results["repo"],
    ref: results["ref"],
    dependencyName: name,
    dependencyVersion: version,
  );
}
