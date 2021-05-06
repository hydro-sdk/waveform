import 'package:git/git.dart';
import 'package:meta/meta.dart';
import 'package:hydro_sdk_version/version.dart';

Future<void> createTag({@required Version version}) async {
  await runGit(
      ["tag", "-a", version.toString(), "-m", "\"${version.toString()}\""]);
}
