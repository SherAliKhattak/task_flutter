Map<String, dynamic> requireJsonMap(dynamic data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return Map<String, dynamic>.from(data);
  throw const FormatException('Expected a JSON object.');
}

double asDouble(dynamic value, {double fallback = 0}) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? fallback;
  return fallback;
}

int asInt(dynamic value, {int fallback = 0}) {
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? fallback;
  return fallback;
}

String asString(dynamic value, {String fallback = ''}) {
  if (value is String) return value;
  return fallback;
}

List<String> asStringList(dynamic value) {
  if (value is! List) return const [];
  return value.whereType<String>().toList(growable: false);
}
