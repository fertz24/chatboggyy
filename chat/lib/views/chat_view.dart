import 'package:chat/views/her_message_bubble_view.dart';
import 'package:chat/views/my_message_bubble_view.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget{
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea( //area segura (si no, no tiene limite)
    //sin el area segura el texto y compononentes haran un overflow, el listado lo pone fuera de la pantalla
        child: Column(
          children: [
              Expanded( //espacio libre para utilizar es donde se pondra a trabajar
                child: Padding( //espacio entre elementos
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10), //mueve de forma horizontal
                  child: ListView.builder(
                    itemCount: 4, //se pone un limite en los mensajes sino este sera infinito
                    itemBuilder: (context, index) {
                    return index % 2 == 0
                      ? HerMessageBubbleView(
                        colorScheme: colorScheme,
                        urlImageBubble:
                            'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif',
                      )
                    : MyMessageBubbleView(
                      colorScheme: colorScheme, 
                      message: "Hola mundo"
                      );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
  }