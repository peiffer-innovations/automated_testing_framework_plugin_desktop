import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_desktop/automated_testing_framework_plugin_desktop.dart';

class TestDesktopHelper {
  /// Registers the test steps to the optional [registry].  If not set, the
  /// default [TestStepRegistry] will be used.
  static void registerTestSteps([TestStepRegistry? registry]) {
    (registry ?? TestStepRegistry.instance).registerCustomSteps([
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: const AssertWindowSizeForm(),
          help: TestDesktopTranslations.atf_desktop_help_assert_window_size,
          id: AssertWindowSizeStep.id,
          keys: const {'height', 'width'},
          quickAddValues: {
            'height': SetWindowSizeStep.kDefaultHeight.toString(),
            'width': SetWindowSizeStep.kDefaultWidth.toString(),
          },
          title: TestDesktopTranslations.atf_desktop_title_assert_window_size,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: AssertWindowSizeStep.fromDynamic,
      ),
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: const SetWindowSizeForm(),
          help: TestDesktopTranslations.atf_desktop_help_set_window_size,
          id: SetWindowSizeStep.id,
          keys: const {'height', 'width'},
          quickAddValues: {
            'height': SetWindowSizeStep.kDefaultHeight.toString(),
            'width': SetWindowSizeStep.kDefaultWidth.toString(),
          },
          title: TestDesktopTranslations.atf_desktop_title_set_window_size,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: SetWindowSizeStep.fromDynamic,
      ),
    ]);
  }
}
