import 'dart:io';
import 'dart:ui';

import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:json_class/json_class.dart';

/// Set's the application's desktop window to a given size.
class AssertWindowSizeStep extends TestRunnerStep {
  AssertWindowSizeStep({
    required this.height,
    required this.width,
  });

  static const id = 'assert_window_size';

  static List<String> get behaviorDrivenDescriptions => List.unmodifiable([
        "assert's the application's window size equals `{{width}} x {{height}}`.",
      ]);

  /// Application's window height.
  final String height;

  /// Application's window width.
  final String width;

  @override
  String get stepId => id;

  /// Creates an instance from a JSON-like map structure.  This expects the
  /// following format:
  ///
  /// ```json
  /// {
  ///   "height": <double>,
  ///   "width": <double>
  /// }
  /// ```
  static AssertWindowSizeStep fromDynamic(dynamic map) {
    AssertWindowSizeStep result;

    if (map == null) {
      throw Exception('[AssertWindowSizeStep.fromDynamic]: map is null');
    } else {
      result = AssertWindowSizeStep(
        height: map['height']!.toString(),
        width: map['width']!.toString(),
      );
    }

    return result;
  }

  /// Asserts the desktop window's size matches the expected size.
  @override
  Future<void> execute({
    required CancelToken cancelToken,
    required TestReport report,
    required TestController tester,
  }) async {
    var height = JsonClass.parseDouble(tester.resolveVariable(this.height))!;
    var width = JsonClass.parseDouble(tester.resolveVariable(this.width))!;

    var name = "$id('$height', '$width')";

    log(
      name,
      tester: tester,
    );

    if (kIsWeb) {
      throw Exception('[AssertWindowSizeStep]: not supported on Web');
    } else if (Platform.isAndroid) {
      throw Exception('[AssertWindowSizeStep]: not supported on Android');
    } else if (Platform.isIOS) {
      throw Exception('[AssertWindowSizeStep]: not supported on iOS');
    } else {
      await DesktopWindow.setWindowSize(Size(width, height));
    }
  }

  @override
  String getBehaviorDrivenDescription(TestController tester) {
    var result = behaviorDrivenDescriptions[0];

    result = result.replaceAll(
      '{{height}}',
      height,
    );

    result = result.replaceAll(
      '{{width}}',
      width,
    );

    return result;
  }

  /// Overidden to ignore the delay
  @override
  Future<void> preStepSleep(Duration duration) async {}

  /// Overidden to ignore the delay
  @override
  Future<void> postStepSleep(Duration duration) async {}

  /// Converts this to a JSON compatible map.  For a description of the format,
  /// see [fromDynamic].
  @override
  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
      };
}
