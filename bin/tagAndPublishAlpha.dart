//@dart = 2.9
//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';
import 'package:waveform/createTag.dart';
import 'package:waveform/nextMetadataVersion.dart';
import 'package:waveform/publishNpmPreRelease.dart';
import 'package:waveform/readTags.dart';
import 'package:waveform/readVersionFromPackage.dart';
import 'package:waveform/writeChangelog.dart';
import 'package:waveform/writeNpmRc.dart';

void main(List<String> args) async {
  var version = Version.parse(readVersionFromPackage());

  var nextAlphaNumber = nextMetadataVersion(
    currentVersion: version.toString(),
    priorVersions: await readTags(),
    metadata: "alpha",
  );

  var versionToPublish = Version(
    version.major,
    version.minor,
    version.patch,
    preRelease: ["alpha", nextAlphaNumber.toString()],
  );

  print("Publishing $versionToPublish");

  await createTag(version: versionToPublish);
  writeNpmRc();
  writeChangelog(version: versionToPublish);
  await publishNpmPreRelease(version: versionToPublish);
}
