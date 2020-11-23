import 'package:version/version.dart';
import 'package:waveform/createTag.dart';
import 'package:waveform/nextNightlyVersion.dart';
import 'package:waveform/publishPreRelease.dart';
import 'package:waveform/readTags.dart';
import 'package:waveform/readVersionFromPackage.dart';

void main(List<String> args) async {
  var version = Version.parse(readVersionFromPackage());

  var nextNightlyNumber = nextNightlyVersion(
      currentVersion: version.toString(), priorVersions: await readTags());

  var versionToPublish = Version(version.major, version.minor, version.patch,
      preRelease: ["nightly", nextNightlyNumber.toString()]);

  print("Publishing $versionToPublish");

  await createTag(version: versionToPublish);
  await publishPreRelease(version: versionToPublish);
}