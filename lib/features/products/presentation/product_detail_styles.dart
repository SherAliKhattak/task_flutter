import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/app/theme/app_theme.dart';
import 'package:flutter_assignment_upwork/core/responsive/screen_space.dart';

/// Text styles for the product detail screen.
abstract final class ProductDetailStyles {
  static TextStyle? appBarTitle(ThemeData theme) {
    return theme.textTheme.labelLarge?.copyWith(
      letterSpacing: 2.8,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? sectionLabel(ThemeData theme) {
    return theme.textTheme.labelSmall?.copyWith(
      letterSpacing: 1.3,
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle? brand(ThemeData theme) {
    return theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle? price(ThemeData theme) {
    return theme.textTheme.headlineMedium?.copyWith(
      color: theme.colorScheme.secondary,
      fontSize: 34.h,
    );
  }

  static TextStyle? mutedSmall(ThemeData theme) {
    return theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle? specLabel(ThemeData theme) {
    return theme.textTheme.labelSmall?.copyWith(
      letterSpacing: 1.1,
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle? reviewQuote(ThemeData theme) {
    return theme.textTheme.titleMedium?.copyWith(
      fontFamily: 'Georgia',
      fontFamilyFallback: AppTheme.serifFallback,
      fontWeight: FontWeight.w500,
      height: 1.25,
    );
  }
}
