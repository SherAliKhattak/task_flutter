String formatPrice(double value) {
  final negative = value < 0;
  final fixed = value.abs().toStringAsFixed(2);
  final parts = fixed.split('.');
  final digits = parts[0];
  final withCommas = digits.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]},',
  );
  return '${negative ? '-' : ''}\$$withCommas.${parts[1]}';
}

String formatCategory(String raw) {
  final words = raw.split(RegExp(r'[-_\s]+')).where((word) => word.isNotEmpty);
  return words
      .map((word) {
        if (word.length == 1) return word.toUpperCase();
        return '${word[0].toUpperCase()}${word.substring(1)}';
      })
      .join(' ');
}

String formatDiscount(double value) {
  final rounded = value.toStringAsFixed(1);
  if (rounded.endsWith('.0')) return '${value.toStringAsFixed(0)}% off';
  return '$rounded% off';
}

String stockLabel({required String availabilityStatus, required int stock}) {
  final status = availabilityStatus.trim();
  if (status.isNotEmpty) return status;
  if (stock <= 0) return 'Out of stock';
  return 'In stock';
}

String? formatReviewDate(DateTime? date) {
  if (date == null) return null;
  final local = date.toLocal();
  final month = local.month.toString().padLeft(2, '0');
  final day = local.day.toString().padLeft(2, '0');
  return '${local.year}-$month-$day';
}
