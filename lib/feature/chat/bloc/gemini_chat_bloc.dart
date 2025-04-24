import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini_clone/feature/chat/models/chat_message.dart'
    show ChatMessage;
import 'package:gemini_clone/feature/chat/repo/get_gemini_response.dart';

part 'gemini_chat_event.dart';
part 'gemini_chat_state.dart';

class GeminiChatBloc extends Bloc<GeminiChatEvent, GeminiChatState> {
  GeminiChatBloc() : super(const GeminiChatState()) {
    on<MessageReceivedFromGeminiEvent>(_receivedFromGemini);
    on<SendMessageEvent>(_sendMessage);
    on<RefreshChatEvent>(_regreshChat);
  }

  _sendMessage(SendMessageEvent event, Emitter<GeminiChatState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        messages: List.of(state.messages)..add(ChatMessage(event.message)),
      ),
    );
    try {
      String response = await GeminiApiService().sendPrompt(event.message);
      add(MessageReceivedFromGeminiEvent(response));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          erroMessage: "Faied! to generate answer, Please try again later",
        ),
      );
    }
  }

  _regreshChat(RefreshChatEvent event, Emitter<GeminiChatState> emit) {
    emit(state.copyWith(erroMessage: "", messages: [], isLoading: false));
  }

  _receivedFromGemini(
    MessageReceivedFromGeminiEvent event,
    Emitter<GeminiChatState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: false,
        messages: List.of(state.messages)
          ..add(ChatMessage(event.message, isSent: false)),
      ),
    );
  }
}
