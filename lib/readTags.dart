import 'package:git/git.dart';

Future<List<String>> readTags() async {
  var res = await runGit(["tag", "--list"]);

  var lines = (res.stdout as String).split(RegExp("\n"));
  lines.removeWhere((x) => x.isEmpty);
  lines.removeWhere((x) => x.trim().isEmpty);

  return lines;
}
