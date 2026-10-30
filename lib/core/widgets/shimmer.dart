import 'package:flutter/material.dart';

/// A shared sweep for [ShimmerBlock] children. Blocks stay square, like the
/// rest of the floor list, and one clock drives every block in the subtree.
class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      _controller
        ..stop()
        ..value = 0.35;
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ColorScheme get _scheme => Theme.of(context).colorScheme;

  bool get _dark => _scheme.brightness == Brightness.dark;

  Color get _base =>
      widget.baseColor ??
      (_dark ? const Color(0xFF2C2823) : const Color(0xFFE4D9CC));

  Color get _highlight =>
      widget.highlightColor ??
      (_dark ? const Color(0xFF4A433C) : const Color(0xFFF8F4EE));

  @override
  Widget build(BuildContext context) {
    return _ShimmerData(
      animation: _controller,
      base: _base,
      highlight: _highlight,
      child: widget.child,
    );
  }
}

class _ShimmerData extends InheritedWidget {
  const _ShimmerData({
    required this.animation,
    required this.base,
    required this.highlight,
    required super.child,
  });

  final Animation<double> animation;
  final Color base;
  final Color highlight;

  @override
  bool updateShouldNotify(_ShimmerData oldWidget) {
    return animation != oldWidget.animation ||
        base != oldWidget.base ||
        highlight != oldWidget.highlight;
  }
}

/// Opaque stand-in for a line, price, or image. Width and height are optional;
/// an omitted axis fills the incoming constraint.
class ShimmerBlock extends StatelessWidget {
  const ShimmerBlock({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return _ShimmerMask(data: _scope(context), width: width, height: height);
  }

  _ShimmerData _scope(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<_ShimmerData>();
    assert(data != null, 'ShimmerBlock must sit under a Shimmer');
    return data!;
  }
}

class _ShimmerMask extends StatelessWidget {
  const _ShimmerMask({
    required this.data,
    required this.width,
    required this.height,
  });

  final _ShimmerData data;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedBuilder(
        animation: data.animation,
        builder: (context, child) {
          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(-1.4 + 2.8 * data.animation.value, 0),
                end: Alignment(-0.2 + 2.8 * data.animation.value, 0),
                colors: [data.base, data.highlight, data.base],
              ).createShader(bounds);
            },
            child: child,
          );
        },
        child: const ColoredBox(color: Colors.white, child: SizedBox.expand()),
      ),
    );
  }
}
