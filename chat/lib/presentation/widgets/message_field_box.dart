import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final Function(String) onSend;

  const MessageFieldBox({super.key, required this.onSend});

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
          print('Quiero enviar el mensaje ${textController.value.text}');
          if (textController.value.text.isNotEmpty) { //si el controller no tiene valor entonces no mostrara nada
            widget.onSend(textController.value.text); 
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
        widget.onSend(value);
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
    hintText: 'Envía tu pregunta',
    suffixIcon: IconButton(onPressed: onSend, icon: const Icon(Icons.send)),
  );

  OutlineInputBorder _customOutlineDecoration(Color color) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(20),
  );
}