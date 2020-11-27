import 'package:meta/meta.dart';
import 'package:version/version.dart';

int nextNightlyVersion({
  @required String currentVersion,
  @required List<String> priorVersions,
}) {
  priorVersions.forEach((x) => print("\"$x\""));
  var res = priorVersions
      .map((x) => x.trim())
      .map((x) => Version.parse(x))
      .where((x) => ((Version version) =>
          x.major == version.major &&
          x.minor == version.minor &&
          x.patch == version.patch &&
          x.leadingPreRelease() == "nightly")(Version.parse(currentVersion)))
      .where((x) => x.leadingPreRelease() == "nightly")
      .where((x) => x.hasNumericPreRelease())
      .map((x) => x.numericPrelease())
      .toList()
        ..sort();

  return res.isNotEmpty ? res.last + 1 : 0;
}
