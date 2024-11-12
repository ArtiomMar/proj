// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../model/chat/chat_serivce.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatService _chatService = ChatService();
  List<String> _messages = [];

  void _sendMessage() async {
    String userMessage = _controller.text;
    if (userMessage.isNotEmpty) {
      setState(() {
        _messages.add('Вы: $userMessage');
      });

      String aiResponse = await _chatService.sendMessage(userMessage);
      setState(() {
        _messages.add('ИИ: $aiResponse');
      });

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Чат с ИИ')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                  _messages[index],
                  style: TextStyle(color: Colors.white),
                ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Введите сообщение'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
