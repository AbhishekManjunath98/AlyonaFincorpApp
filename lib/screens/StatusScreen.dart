import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                //color: Color.fromARGB(255, 196, 6, 139),
                child: const Text(
                  "StatusScreen Whatsapp",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ))));
  }
}
