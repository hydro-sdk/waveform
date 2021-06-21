//@dart = 2.9
import 'package:args/args.dart';
import 'package:github/github.dart';
import 'package:waveform/catchupBranch.dart';

void main(List<String> args) async {
  var parser = ArgParser();

  parser.addOption("org");
  parser.addOption("repo");
  parser.addOption("author");

  var results = parser.parse(args);

  var prs = (await GitHub()
          .pullRequests
          .list(RepositorySlug(results["org"], results["repo"]))
          .toList())
      .where((x) => x.user?.login == results["author"])
      .where((x) => x.state == "open")
      .toList();

  for (var pr in prs) {
      print("Merging the latest from ${pr.base?.ref} into ${pr.head?.ref}");
      await catchupBranch(
        baseBranchName: pr.base.ref,
        headBranchName: pr.head.ref,
      );
  }
}
