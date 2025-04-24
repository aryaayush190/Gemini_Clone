import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_clone/feature/chat/bloc/gemini_chat_bloc.dart';

class SendMessageWidget extends StatelessWidget {
  SendMessageWidget({super.key});
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiChatBloc, GeminiChatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: BorderRadius.circular(28),
              // border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.add), // Optional
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Ask Gemini',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      // Add logic to handle submission
                    },
                  ),
                ),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        context.read<GeminiChatBloc>().add(
                          SendMessageEvent(_messageController.text),
                        );
                        _messageController.clear();
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
