import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/views/her_message_bubble_view.dart';
import 'package:chat/presentation/views/my_message_bubble_view.dart';
import 'package:chat/presentation/widgets/message_field_box.dart';
import 'package:chat/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget{
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea( //area segura (si no, no tiene limite)
    //sin el area segura el texto y compononentes haran un overflow, el listado lo pone fuera de la pantalla
        child: Column(
          children: [
              Expanded( //espacio libre para utilizar es donde se pondra a trabajar
                child: Padding( //espacio entre elementos
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10), //mueve de forma horizontal
                  child: ListView.builder(
                    itemCount: chatProvider.messagesList.length, //longitud de las cadenas del listado
                    controller: chatProvider.scrollController,
                    itemBuilder: (context, index) {
                    return chatProvider.messagesList[index].fromWho == FromWho.hers
                      ? HerMessageBubbleView(
                        colorScheme: colorScheme,
                        message: chatProvider.messagesList[index],
                      )
                    : MyMessageBubbleView(
                      colorScheme: colorScheme, 
                      message: chatProvider.messagesList[index].text,
                      );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10, 
                vertical: 10,
              ),
              child: MessageFieldBox(
                onValue: (String value) => chatProvider.sendMessage(value)
              ),
            ),
          ],
        ),
      );
    }
  }