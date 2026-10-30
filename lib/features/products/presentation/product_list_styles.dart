import 'package:flutter_assignment_upwork/core/packages.dart';

/// Text styles for the product list screen.
abstract final class ProductListStyles {
  static TextStyle? brand(ThemeData theme) {
    return theme.textTheme.labelSmall?.copyWith(
      letterSpacing: 2.6,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? screenTitle(ThemeData theme) {
    return theme.textTheme.headlineSmall;
  }

  static TextStyle? signedInName(ThemeData theme) {
    return theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle? endCaption(ThemeData theme) {
    return theme.textTheme.bodySmall;
  }
}
