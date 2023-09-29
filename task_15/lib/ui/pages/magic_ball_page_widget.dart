import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import '../../data/repository.dart';
import '../components/light_source_widget.dart';
import '../components/magic_ball_message_widget.dart';
import '../components/magic_ball_widget.dart';

class MagicBallPageWidget extends StatefulWidget {
  const MagicBallPageWidget({
    super.key,
    required this.repository,
  });

  final Repository repository;

  @override
  State<MagicBallPageWidget> createState() => _MagicBallPageWidgetState();
}

class _MagicBallPageWidgetState extends State<MagicBallPageWidget>
    with TickerProviderStateMixin {
  late AnimationController _ballController;
  late AnimationController _lightController;
  late Animation<double> _ballScaleAnimation;
  late Animation<double> _ballOpacityAnimation;
  late Animation<double> _lightOpacityAnimation;
  late ShakeDetector _shakeDetector;
  bool _shouldFetchMessage = false;
  double _bottomTextPosition = 56.0;

  @override
  void initState() {
    super.initState();

    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: _ballAction,
    );

    _initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _ballController.dispose();
    _lightController.dispose();
    _shakeDetector.stopListening();
  }

  void _initAnimation() {
    _ballController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _lightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );

    _ballScaleAnimation = Tween<double>(begin: 1.0, end: 2.7).animate(
      CurvedAnimation(
        parent: _ballController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _lightOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _lightController,
        curve: Curves.easeIn,
      ),
    );

    _ballOpacityAnimation = Tween<double>(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(
        parent: _lightController,
        curve: Curves.linear,
      ),
    );

    _ballController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _lightController.forward();
        setState(() {
          _shouldFetchMessage = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        _lightController.reverse();
      }
    });

    _lightController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _bottomTextPosition = -(_bottomTextPosition);
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _bottomTextPosition = 56.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0724),
            Color(0xFF000000),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: _ballAction,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ScaleTransition(
                          scale: _ballScaleAnimation,
                          child: FadeTransition(
                            opacity: _ballOpacityAnimation,
                            child: const CrystalBallWidget(),
                          ),
                        ),
                        MagicBallMessageWidget(
                          repository: widget.repository,
                          shouldFetchMessage: _shouldFetchMessage,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _lightOpacityAnimation,
                    child: const LightSourceWidget(),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: _bottomTextPosition,
            duration: const Duration(milliseconds: 10),
            child: const SizedBox(
              width: 200,
              child: Text(
                'Нажмите на шар \nили потрясите телефон',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF727272),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _ballAction() {
    if (_ballScaleAnimation.status == AnimationStatus.dismissed) {
      _ballController.forward();
    } else {
      setState(() {
        _shouldFetchMessage = false;
      });

      _ballController.reverse();
    }
  }
}
