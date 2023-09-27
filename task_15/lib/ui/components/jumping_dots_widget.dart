import 'package:flutter/material.dart';

class JumpingDotsWidget extends StatefulWidget {
  const JumpingDotsWidget({
    super.key,
    required this.numberOfDots,
  });

  final int numberOfDots;

  @override
  State<JumpingDotsWidget> createState() => _JumpingDotsWidgetState();
}

class _JumpingDotsWidgetState extends State<JumpingDotsWidget>
    with TickerProviderStateMixin {
  final double _size = 8;
  final double _initialScale = 1.0;
  final double _scale = 2.0;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _dotAnimations;
  late int _numberOfDots;

  @override
  void initState() {
    super.initState();
    _numberOfDots = widget.numberOfDots;
    _initAnimation();
    _startAnimation();
  }

  void _initAnimation() {
    _controllers = List.generate(_numberOfDots, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
    });

    _dotAnimations = List.generate(_numberOfDots, (index) {
      return Tween<double>(begin: _initialScale, end: _scale).animate(
        CurvedAnimation(
          parent: _controllers[index],
          curve: Curves.fastOutSlowIn,
        ),
      );
    });

    for (int i = 0; i < _numberOfDots; i++) {
      _controllers[i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllers[i].reverse();

          if (i != _controllers.length - 1) {
            _controllers[i + 1].forward();
          } else {
            _controllers[0].forward();
          }
        }
      });
    }
  }

  void _startAnimation() {
    _controllers.first.forward();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_numberOfDots, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ScaleTransition(
              scale: _dotAnimations[index],
              child: _DotWidget(
                color: Colors.white,
                size: _size,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _DotWidget extends StatelessWidget {
  const _DotWidget({
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
