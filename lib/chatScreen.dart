import 'package:baatuni/secrets.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _openAI = OpenAI.instance.build(
      token: api_key,
      enableLog: true,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
  ChatUser _currentuser = ChatUser(
      id: "1",
      firstName: "Yash",
      lastName: "Sharma",
      profileImage: "assets/doge.png");
  ChatUser _gpttuser = ChatUser(
      id: "1",
      firstName: "Bhaiya",
      lastName: "",
      profileImage: "assets/doge.png");
  List<ChatMessage> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baatuni"),
      ),
      body: DashChat(
          currentUser: _currentuser,
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });
  }
}
