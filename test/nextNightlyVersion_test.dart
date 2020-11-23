import 'package:flutter_test/flutter_test.dart';

import 'package:waveform/nextNightlyVersion.dart';

void main() {
  test('', () {
    expect(nextNightlyVersion(currentVersion: "0.0.1", priorVersions: []), 0);
    expect(
        nextNightlyVersion(
            currentVersion: "0.0.1",
            priorVersions: ["1.2.3", "3.2.1", "0.0.1-pre"]),
        0);

    expect(
        nextNightlyVersion(
            currentVersion: "0.0.1-nightly.0",
            priorVersions: ["1.2.3", "3.2.1", "0.0.1-nightly.1"]),
        2);

    expect(
        nextNightlyVersion(currentVersion: "0.0.1", priorVersions: [
          "1.2.3",
          "3.2.1",
          "0.0.1-nightly.1",
          "0.0.1-nightly.2",
          "0.0.1-nightly.905",
          "0.0.2-nightly.1000"
        ]),
        906);

    expect(
        nextNightlyVersion(currentVersion: "0.0.3", priorVersions: [
          "1.2.3",
          "3.2.1",
          "0.0.1-nightly.1",
          "0.0.1-nightly.2",
          "0.0.1-nightly.905",
          "0.0.2-nightly.1000"
        ]),
        0);
  });
}
