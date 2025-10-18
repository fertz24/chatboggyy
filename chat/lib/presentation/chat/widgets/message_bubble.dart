import 'package:chat/presentation/chat/widgets/image_bubble.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final Color colorBubble;
  final Widget? child;
  final String? urlImageBubble;

  const MessageBubble({
    super.key, 
    required this.alignment, 
    required this.colorBubble, 
    this.child,
    this.urlImageBubble,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        if(child != null) ...[ //concatena un array 
        Container(
          decoration: BoxDecoration(
            color: colorBubble, 
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: child!,
          ),
        ),
        const SizedBox(height: 10),
      ],
        if (urlImageBubble != null) ...[
        ImageBubble(imageUrl: urlImageBubble!),
        const SizedBox(height: 10),
        ],
      ],
    );
  }
}