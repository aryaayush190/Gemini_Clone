part of 'gemini_chat_bloc.dart';

abstract class GeminiChatEvent extends Equatable {
  const GeminiChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends GeminiChatEvent {
  final String message;
  const SendMessageEvent(this.message);
}

class RefreshChatEvent extends GeminiChatEvent {}

class MessageReceivedFromGeminiEvent extends GeminiChatEvent {
  final String message;
  const MessageReceivedFromGeminiEvent(this.message);
}
