import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_clone/feature/chat/bloc/gemini_chat_bloc.dart';
import 'package:gemini_clone/feature/chat/models/chat_message.dart';
import 'package:gemini_clone/views/widgets/chat_bubble.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiChatBloc, GeminiChatState>(
      builder: (context, state) {
        return state.erroMessage.isNotEmpty
            ? Center(child: Text(state.erroMessage))
            : state.messages.isEmpty
            ? Center(
              child: Text(
                'Hello, Emulator',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  foreground:
                      Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[Colors.blue, Colors.pink],
                        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            )
            : SingleChildScrollView(
              child: Column(
                children: [
                  for (ChatMessage i in state.messages)
                    ChatBubble(text: i.message, isUser: i.isSent),
                ]..add(
                  state.isLoading
                      ? const ChatBubble(text: "Thinking....", isUser: false)
                      : Container(),
                ),
              ),
            );
      },
    );
  }
}
