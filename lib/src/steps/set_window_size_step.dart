import 'dart:io';
import 'dart:ui';

import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:json_class/json_class.dart';

/// Set's the application's desktop window to a given size.
class SetWindowSizeStep extends TestRunnerStep {
  SetWindowSizeStep({
    required this.height,
    required this.width,
  });

  static const id = 'set_window_size';
  static const kDefaultHeight = 768.0;
  static const kDefaultWidth = 1024.0;

  static List<String> get behaviorDrivenDescriptions => List.unmodifiable([
        "set the application's window size to `{{width}} x {{height}}`.",
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
  static SetWindowSizeStep fromDynamic(dynamic map) {
    SetWindowSizeStep result;

    if (map == null) {
      throw Exception('[SetWindowSizeStep.fromDynamic]: map is null');
    } else {
      result = SetWindowSizeStep(
        height: (map['height'] ?? kDefaultHeight).toString(),
        width: (map['width'] ?? kDefaultWidth).toString(),
      );
    }

    return result;
  }

  /// Sets the desktop window's size or fails if the application is not a native
  /// desktop build.
  @override
  Future<void> execute({
    required CancelToken cancelToken,
    required TestReport report,
    required TestController tester,
  }) async {
    var height = JsonClass.parseDouble(tester.resolveVariable(this.height)) ??
        kDefaultHeight;
    var width = JsonClass.parseDouble(tester.resolveVariable(this.width)) ??
        kDefaultWidth;

    var name = "$id('$height', '$width')";

    log(
      name,
      tester: tester,
    );

    if (kIsWeb) {
      throw Exception('[SetWindowSizeStep]: not supported on Web');
    } else if (Platform.isAndroid) {
      throw Exception('[SetWindowSizeStep]: not supported on Android');
    } else if (Platform.isIOS) {
      throw Exception('[SetWindowSizeStep]: not supported on iOS');
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

  /// Converts this to a JSON compatible map.  For a description of the format,
  /// see [fromDynamic].
  @override
  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
      };
}
