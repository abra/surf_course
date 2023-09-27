import 'package:flutter/material.dart';

import '../../data/message_entity.dart';
import '../../data/repository.dart';
import 'jumping_dots_widget.dart';

class MagicBallMessageWidget extends StatefulWidget {
  const MagicBallMessageWidget({
    super.key,
    required this.repository,
    required this.getMessage,
  });

  final Repository repository;
  final bool getMessage;

  @override
  State<MagicBallMessageWidget> createState() => _MagicBallMessageWidgetState();
}

class _MagicBallMessageWidgetState extends State<MagicBallMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (widget.getMessage) {
          return FutureBuilder<MessageEntity>(
            future: widget.repository.getMessage(),
            builder: (BuildContext ctx, AsyncSnapshot<MessageEntity> snapshot) {
              Widget child;

              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data!;
                child = FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    data.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                child = const Text(
                  'Error. Try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                  ),
                );
              } else {
                child = const JumpingDotsWidget(
                  numberOfDots: 4,
                );
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: child,
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
