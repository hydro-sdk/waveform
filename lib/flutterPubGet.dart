import 'dart:convert';
import 'dart:io';

Future<void> flutterPubGet() async {
  await Process.start("flutter", ["pub", "get"]).then((process) {
    process.stdout.transform(utf8.decoder).listen((data) => print(data));
    process.stderr.transform(utf8.decoder).listen((data) => print(data));
  });
}
