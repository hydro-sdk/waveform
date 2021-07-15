//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';

int nextMetadataVersion({
  required String currentVersion,
  required List<String> priorVersions,
  required String metadata,
}) {
  var res = priorVersions
      .map((x) => x.trim())
      .map((x) => Version.parse(x))
      .where((x) => ((Version version) =>
          x.major == version.major &&
          x.minor == version.minor &&
          x.patch == version.patch &&
          x.leadingPreRelease() == metadata)(Version.parse(currentVersion)))
      .where((x) => x.leadingPreRelease() == metadata)
      .where((x) => x.hasNumericPreRelease())
      .map((x) => x.numericPrelease())
      .toList()
        ..sort();

  return res.isNotEmpty ? res.last + 1 : 0;
}
