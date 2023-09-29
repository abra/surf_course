import 'package:flutter/material.dart';

import '../../data/message_entity.dart';
import '../../data/repository.dart';
import 'jumping_dots_indicator_widget.dart';

class MagicBallMessageWidget extends StatelessWidget {
  const MagicBallMessageWidget({
    super.key,
    required this.repository,
    required this.shouldFetchMessage,
  });

  final Repository repository;
  final bool shouldFetchMessage;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (!shouldFetchMessage) {
          return const SizedBox.shrink();
        }

        return FutureBuilder<MessageEntity>(
          future: repository.getMessage(),
          builder: (BuildContext ctx, AsyncSnapshot<MessageEntity> snapshot) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _MessageFetchWidget(snapshot: snapshot),
            );
          },
        );
      },
    );
  }
}

class _MessageFetchWidget extends StatelessWidget {
  const _MessageFetchWidget({
    required this.snapshot,
  });

  final AsyncSnapshot<MessageEntity> snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.done) {
      // Если ошибка или null
      if (snapshot.hasError || snapshot.data == null) {
        return const Text(
          'Error. Try again',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 36,
          ),
        );
      }

      final data = snapshot.data!;

      return FractionallySizedBox(
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
    } else {
      return const JumpingDotsIndicatorWidget(
        numberOfDots: 4,
      );
    }
  }
}
