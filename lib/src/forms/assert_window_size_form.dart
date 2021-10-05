import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_desktop/automated_testing_framework_plugin_desktop.dart';
import 'package:flutter/material.dart';
import 'package:static_translations/static_translations.dart';

class AssertWindowSizeForm extends TestStepForm {
  const AssertWindowSizeForm();

  @override
  bool get supportsMinified => true;

  @override
  TranslationEntry get title =>
      TestDesktopTranslations.atf_desktop_title_assert_window_size;

  @override
  Widget buildForm(
    BuildContext context,
    Map<String, dynamic>? values, {
    bool minify = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (minify != true)
          buildHelpSection(
            context,
            TestDesktopTranslations.atf_desktop_help_assert_window_size,
            minify: minify,
          ),
        buildValuesSection(
          context,
          [
            buildEditText(
              context: context,
              defaultValue: SetWindowSizeStep.kDefaultHeight.toString(),
              id: 'height',
              label: TestDesktopTranslations.atf_desktop_form_height,
              values: values ?? <String, dynamic>{},
            ),
          ],
          minify: minify,
        ),
        buildValuesSection(
          context,
          [
            buildEditText(
              context: context,
              defaultValue: SetWindowSizeStep.kDefaultWidth.toString(),
              id: 'width',
              label: TestDesktopTranslations.atf_desktop_form_width,
              values: values ?? <String, dynamic>{},
            ),
          ],
          minify: minify,
        ),
      ],
    );
  }
}
