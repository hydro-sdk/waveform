import 'package:hydro_sdk_version/version.dart';
import 'package:waveform/createTag.dart';
import 'package:waveform/nextNightlyVersion.dart';
import 'package:waveform/publishNpmPreRelease.dart';
import 'package:waveform/readTags.dart';
import 'package:waveform/readVersionFromPackage.dart';
import 'package:waveform/writeChangelog.dart';
import 'package:waveform/writeNpmRc.dart';

void main(List<String> args) async {
  var version = Version.parse(readVersionFromPackage());

  var nextNightlyNumber = nextNightlyVersion(
      currentVersion: version.toString(), priorVersions: await readTags());

  var versionToPublish = Version(version.major, version.minor, version.patch,
      preRelease: ["nightly", nextNightlyNumber.toString()]);

  print("Publishing $versionToPublish");

  await createTag(version: versionToPublish);
  writeNpmRc();
  writeChangelog(version: versionToPublish);
  await publishNpmPreRelease(version: versionToPublish);
}
