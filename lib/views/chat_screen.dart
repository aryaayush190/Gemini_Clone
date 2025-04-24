import 'package:flutter/material.dart';
import 'package:gemini_clone/feature/chat/widgets/chat_history_widget.dart';
import 'package:gemini_clone/feature/chat/widgets/send_message_widget.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: ChatHistoryWidget()), SendMessageWidget()],
      ),
    );
  }
}
