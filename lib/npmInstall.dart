import 'dart:convert';
import 'dart:io';

Future<void> npmInstall() async {
  await Process.start("npm", ["install"]).then((process) {
    process.stdout.transform(utf8.decoder).listen((data) => print(data));
    process.stderr.transform(utf8.decoder).listen((data) => print(data));
  });
}
