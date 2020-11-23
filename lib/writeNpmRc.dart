import 'dart:io';

void writeNpmRc() => File(".npmrc")
    .writeAsStringSync("//registry.npmjs.org/:_authToken=\${NPM_TOKEN}");
