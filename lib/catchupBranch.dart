import 'dart:io';

Future<void> catchupBranch({
  required String baseBranchName,
  required String headBranchName,
}) async {
  var proc = await Process.run("git", ["checkout", headBranchName]);

  if (proc.stderr != null) {
    print(proc.stderr);
  }

  if (proc.exitCode != 0) {
    throw proc.exitCode;
  }

  proc = await Process.run("git",
      ["merge", "--strategy-option", "ours", baseBranchName, "--no-edit"]);

  if (proc.stderr != null) {
    print(proc.stderr);
  }

  if (proc.exitCode != 0) {
    throw proc.exitCode;
  }

  proc = await Process.run("git", ["push"]);

  if (proc.stderr != null) {
    print(proc.stderr);
  }

  if (proc.exitCode != 0) {
    throw proc.exitCode;
  }
}
