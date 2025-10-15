import 'package:chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class HerMessageBubbleView extends StatelessWidget {

  final ColorScheme colorScheme;
  final String message;

  const HerMessageBubbleView({
    super.key,
    required this.colorScheme,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBubble(
      alignment: CrossAxisAlignment.start,
      colorBubble: colorScheme.secondary,
      child: Text(message, style: TextStyle(color: colorScheme.onSecondary)),
    );
  }

}