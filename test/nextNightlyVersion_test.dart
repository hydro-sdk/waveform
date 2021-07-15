//@dart = 2.9
import 'package:flutter_test/flutter_test.dart';

import 'package:waveform/nextMetadataVersion.dart';

void main() {
  test('', () {
    expect(
        nextMetadataVersion(
          currentVersion: "0.0.1",
          priorVersions: [],
          metadata: "nightly",
        ),
        0);
    expect(
        nextMetadataVersion(
          currentVersion: "0.0.1",
          priorVersions: ["1.2.3", "3.2.1", "0.0.1-pre"],
          metadata: "nightly",
        ),
        0);

    expect(
        nextMetadataVersion(
          currentVersion: "0.0.1-nightly.0",
          priorVersions: ["1.2.3", "3.2.1", "0.0.1-nightly.1"],
          metadata: "nightly",
        ),
        2);

    expect(
        nextMetadataVersion(
          currentVersion: "0.0.1",
          priorVersions: [
            "1.2.3",
            "3.2.1",
            "0.0.1-nightly.1",
            "0.0.1-nightly.2",
            "0.0.1-nightly.905",
            "0.0.2-nightly.1000"
          ],
          metadata: "nightly",
        ),
        906);

    expect(
        nextMetadataVersion(
          currentVersion: "0.0.3",
          priorVersions: [
            "1.2.3",
            "3.2.1",
            "0.0.1-nightly.1",
            "0.0.1-nightly.2",
            "0.0.1-nightly.905",
            "0.0.2-nightly.1000"
          ],
          metadata: "nightly",
        ),
        0);
  });
}
