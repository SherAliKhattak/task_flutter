import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';

abstract final class AppTheme {
  static const serifFallback = ['Times New Roman', 'Nimbus Roman', 'serif'];

  static ThemeData get light => _theme(
    brightness: Brightness.light,
    paper: const Color(0xFFF3EEE6),
    ink: const Color(0xFF1C1916),
    rust: const Color(0xFFB8431F),
    line: const Color(0xFFD5CBBC),
    muted: const Color(0xFF6E665C),
  );

  static ThemeData get dark => _theme(
    brightness: Brightness.dark,
    paper: const Color(0xFF141311),
    ink: const Color(0xFFF3EEE6),
    rust: const Color(0xFFE07A4C),
    line: const Color(0xFF3A342C),
    muted: const Color(0xFFB7AEA3),
  );

  static ThemeData _theme({
    required Brightness brightness,
    required Color paper,
    required Color ink,
    required Color rust,
    required Color line,
    required Color muted,
  }) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: ink,
      onPrimary: paper,
      secondary: rust,
      onSecondary: paper,
      error: const Color(0xFF9F2D2D),
      onError: const Color(0xFFFFF8F6),
      surface: paper,
      onSurface: ink,
      onSurfaceVariant: muted,
      outline: line,
      outlineVariant: line,
    );

    final base = ThemeData(brightness: brightness, useMaterial3: true);
    final text = base.textTheme.apply(bodyColor: ink, displayColor: ink);

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: paper,
      textTheme: text.copyWith(
        headlineMedium: text.headlineMedium?.copyWith(
          fontFamily: 'Georgia',
          fontFamilyFallback: serifFallback,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.6,
          height: 1.05,
        ),
        headlineSmall: text.headlineSmall?.copyWith(
          fontFamily: 'Georgia',
          fontFamilyFallback: serifFallback,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.4,
        ),
        titleLarge: text.titleLarge?.copyWith(
          fontFamily: 'Georgia',
          fontFamilyFallback: serifFallback,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: paper,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: line,
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        labelStyle: TextStyle(color: muted, letterSpacing: 0.4),
        border: UnderlineInputBorder(borderSide: BorderSide(color: line)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: line, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ink, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ink,
          foregroundColor: paper,
          minimumSize: Size.fromHeight(50.h),
          shape: const RoundedRectangleBorder(),
          textStyle: const TextStyle(
            letterSpacing: 1.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: rust),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: rust),
    );
  }
}
