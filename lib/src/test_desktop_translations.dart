import 'package:static_translations/static_translations.dart';

class TestDesktopTranslations {
  static const atf_desktop_form_height = TranslationEntry(
    key: 'atf_desktop_form_height',
    value: 'Height',
  );

  static const atf_desktop_form_width = TranslationEntry(
    key: 'atf_desktop_form_width',
    value: 'Width',
  );

  static const atf_desktop_help_assert_window_size = TranslationEntry(
    key: 'atf_desktop_help_assert_window_size',
    value:
        'Asserts the window size is of the given width and height on desktop application, fails if not on a native desktop platform.',
  );

  static const atf_desktop_help_set_window_size = TranslationEntry(
    key: 'atf_desktop_help_set_window_size',
    value:
        'Sets the window size on desktop application, fails if not on a native desktop platform.',
  );

  static const atf_desktop_title_assert_window_size = TranslationEntry(
    key: 'atf_desktop_title_assert_window_size',
    value: 'Assert Window Size',
  );

  static const atf_desktop_title_set_window_size = TranslationEntry(
    key: 'atf_desktop_title_set_window_size',
    value: 'Set Window Size',
  );
}
