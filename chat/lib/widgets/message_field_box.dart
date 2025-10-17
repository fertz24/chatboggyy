import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget{
  const MessageFieldBox({super.key});

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
          print('Quiero enviar el mensaje ${textController}');
          textController.clear();
          focusNode.requestFocus();
        },
      ),
      onTapOutside: (event) {
        print('Quiero saber que haces $event');
        focusNode.unfocus();
      },

      onFieldSubmitted: (value) {
        print('Hola soy del equipo de las fers $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

  InputDecoration _customImputDecoration({
    required ColorScheme colors,
    required VoidCallback onSend,
    }) => 
  InputDecoration(
    enabledBorder: _customOutlineDecoration(colors.primary),
    focusedBorder: _customOutlineDecoration(colors.primaryContainer),
    hintText: 'Escribe un mensaje',
    suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.send))
    );

  OutlineInputBorder _customOutlineDecoration(Color color) =>
  OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(20),
  );
}