import 'package:chat/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/config/theme/app_theme.dart';
import 'package:chat/presentation/screen/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider( //mas de un proveedor, clase proveedora hay mas de una
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      //el guion bajo es el context
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColors: 2).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}