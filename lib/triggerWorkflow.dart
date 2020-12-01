import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:version/version.dart';

Future<void> triggerWorkflow({
  @required String authToken,
  @required String repoName,
  @required String ref,
  @required String dependencyName,
  @required Version dependencyVersion,
}) async =>
    post(
        "https://github.com/repos/hydro-sdk/$repoName/actions/workflows/waveform-upgrade/dispatches",
        headers: {
          "Authorization": "token $authToken",
          "Accept": "application/vnd.github.v3+json",
        },
        body: """
       {"ref":"$ref", "inputs": {"depName": "@hydro-sdk/$dependencyName","depVersion":"$dependencyVersion" }}
        """);
