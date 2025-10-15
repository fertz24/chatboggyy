import 'package:flutter/material.dart';

class ChatView extends StatelessWidget{
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( //area segura (si no, no tiene limite)
    //sin el area segura el texto y compononentes haran un overflow, el listado lo pone fuera de la pantalla
        child: Column(
          children: [
              Expanded( //espacio libre para utilizar es donde se pondra a trabajar
                child: Padding( //espacio entre elementos
                  padding: EdgeInsetsDirectional.symmetric
                  (horizontal: 10), //mueve de forma horizontal
                  child: ListView.builder(
                    itemCount: 20, //se pone un limite en los mensajes sino este sera infinito
                    itemBuilder: (context, index) {
                    return Text('Message $index');
                  },
                ),
              ),
            ),
            const Text('This is where the chat messages will be displayed.'), 
          ],
        ),
      );
    }
  }