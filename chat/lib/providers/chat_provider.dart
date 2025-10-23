import 'package:chat/domain/entities/message.dart';
import 'package:chat/infrastructure/datasource/get_yes_no_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{ //este le ayuda a provider, con esto notificamos cambios

  final ScrollController scrollController = ScrollController();

  final List<Message> messagesList = [];//listado de mensajes estatico
    
  Future<void> sendMessage(String message) async {
      final newMessage = Message(text: message, fromWho: FromWho.me);
      await setMessagesList(newMessage);
      final response = await GetYesNoAnswer().getAnswer();
      await setMessagesList(response);
  }

    Future<void> setMessagesList(Message message) async {
      messagesList.add(message);
      notifyListeners();
      moveScrollToBotton();
    }

    Future<void> moveScrollToBotton() async {
      await Future.delayed(const Duration(milliseconds: 300));

      scrollController.animateTo(
      scrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut,
    );
    }
    
  }
