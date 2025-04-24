part of 'gemini_chat_bloc.dart';

class GeminiChatState {
  final List<ChatMessage> messages;
  final String erroMessage;
  final bool isLoading;

  const GeminiChatState({
    this.erroMessage = "",
    this.isLoading = false,
    this.messages = const [],
  });

  GeminiChatState copyWith({
    List<ChatMessage>? messages,
    String? erroMessage,
    bool? isLoading,
  }) {
    return GeminiChatState(
      erroMessage: erroMessage ?? this.erroMessage,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
