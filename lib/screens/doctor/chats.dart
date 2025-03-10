import 'package:flutter/material.dart';

class DoctorChats extends StatefulWidget {
  const DoctorChats({super.key});

  @override
  State<DoctorChats> createState() => _DoctorChatsState();
}

class _DoctorChatsState extends State<DoctorChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Chats"),
      ),
    );
  }
}
