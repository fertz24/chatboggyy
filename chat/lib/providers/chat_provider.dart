import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{ //este le ayuda a provider, con esto notificamos cambios

  final List<Message> messagesList = [ //listado de mensajes estatico
    Message(text: "Hola, ¿Cómo estas?", 
    imageUrl: 'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif',
    fromWho: FromWho.hers
    ),
    Message(text: "¡Hola! Estoy bien, gracias. ¿Y tú?", fromWho: FromWho.me),
    Message(
      text: "También estoy bien. ¿Qué has estado haciendo últimamente?",
      imageUrl:
          'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif',
      fromWho: FromWho.hers,
    ),
    Message(
      text: "He estado trabajando en algunos proyectos de Flutter.",
      fromWho: FromWho.me,
    ),
    Message(
      text: "He estado trabajando en algunos proyectos de Flutter.",
      fromWho: FromWho.me,
    ),
  ];

  Future<void> sendMessage(String message) async {
     final newMessage = Message(text: message, fromWho: FromWho.me);
    messagesList.add(newMessage);
    // notifyListeners();
  }
}