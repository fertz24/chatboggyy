import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fertz chat'), centerTitle: false, 
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://www.google.com/imgres?q=oso%20pardo%20escandalosos%20foto%20de%20perfil&imgurl=https%3A%2F%2Fi.pinimg.com%2F236x%2Ff0%2Fd6%2Fb4%2Ff0d6b4af4f10cb2e75460bfc8b910a97.jpg&imgrefurl=https%3A%2F%2Far.pinterest.com%2Fagustinarevechini%2Fpardo-escandalosos%2F&docid=4i8dC86uerlKMM&tbnid=hRI24GvZI476pM&vet=12ahUKEwjcstKKlpGQAxWCJEQIHcwwALYQM3oECBgQAA..i&w=236&h=236&hcb=2&ved=2ahUKEwjcstKKlpGQAxWCJEQIHcwwALYQM3oECBgQAA#imgrc=hRI24GvZI476pM&imgdii=nPWbZKpS7k1CjM'),
        ),
      ),
      body: Placeholder(), //vista donde van a interactuar los mensajes
    );
  }
}