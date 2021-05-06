import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:hydro_sdk_version/version.dart';

Future<void> triggerWorkflow({
  @required String authToken,
  @required String repoName,
  @required String ref,
  @required String dependencyName,
  @required Version dependencyVersion,
}) async {
  var res = await post(
      "https://api.github.com/repos/hydro-sdk/$repoName/actions/workflows/waveform-upgrade.yml/dispatches",
      headers: {
        "Authorization": "token $authToken",
        "Accept": "application/vnd.github.v3+json",
      },
      body:
          '{"ref":"$ref", "inputs": {"depName": "$dependencyName","depVersion":"$dependencyVersion" }}');

  print(res.statusCode);
  print(res.body);
}
