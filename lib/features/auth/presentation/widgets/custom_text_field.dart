import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Underline field with the tracked label used on the staff entrance.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.fieldKey,
    this.hintText,
    this.focusNode,
    this.obscureText = false,
    this.textInputAction,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.suffix,
    this.onSubmitted,
  });

  final String label;
  final TextEditingController controller;
  final Key? fieldKey;
  final String? hintText;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? suffix;
  final ValueChanged<String>? onSubmitted;

  ThemeData get theme => Get.theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            letterSpacing: 1.4,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        TextField(
          key: fieldKey,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          textInputAction: textInputAction,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          autofillHints: autofillHints,
          decoration: InputDecoration(hintText: hintText, suffixIcon: suffix),
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
