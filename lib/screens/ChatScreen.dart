import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                //color: Color.fromARGB(255, 6, 194, 15),
                child: dummyText())));
  }

  Widget dummyText() {
    return const Text(
      "ChatScreen Whatsapp",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
    );
  }
}
