import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final void Function(String) onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode(); //para cerrar el teclado
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: _customImputDecoration(
        colors: colors,
        onSend: () {
          final textValue = textController.value.text;
          print(textController.value.text);
          if (textValue.isNotEmpty) {
            
            widget.onValue(textValue);
            textController.clear();
            focusNode.requestFocus();
          }
        },
      ),
      onTapOutside: (event) {
        print('Quiero saber que haces $event');
        focusNode.unfocus();
      },

      onFieldSubmitted: (value) {
        widget.onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

  InputDecoration _customImputDecoration({
    required ColorScheme colors,
    required VoidCallback onSend,
  }) => InputDecoration(
    enabledBorder: _customOutlineDecoration(colors.primary),
    focusedBorder: _customOutlineDecoration(colors.primaryContainer),
    hintText: 'Escribe un mensaje',
    suffixIcon: IconButton(onPressed: onSend, icon: const Icon(Icons.send)),
  );

  OutlineInputBorder _customOutlineDecoration(Color color) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(20),
      );
}