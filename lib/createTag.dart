import 'package:git/git.dart';
//ignore: import_of_legacy_library_into_null_safe
import 'package:hydro_sdk_version/version.dart';

Future<void> createTag({
  required Version version,
}) async {
  await runGit(
      ["tag", "-a", version.toString(), "-m", "\"${version.toString()}\""]);
}
