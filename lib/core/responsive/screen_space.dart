import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Lengths from a 390×844 layout, scaled with [Get.width] and [Get.height].
///
/// [Get.width] needs the navigator context. Before that exists, the platform
/// view supplies the same logical size so theme setup does not crash.
extension ScreenSpace on num {
  double get w => this * _logicalSize.width / 390;

  double get h => this * _logicalSize.height / 844;
}

Size get _logicalSize {
  if (Get.context != null) return Size(Get.width, Get.height);

  final dispatcher = WidgetsBinding.instance.platformDispatcher;
  final view =
      dispatcher.implicitView ??
      (dispatcher.views.isEmpty ? null : dispatcher.views.first);
  if (view == null) return const Size(390, 844);
  return view.physicalSize / view.devicePixelRatio;
}
