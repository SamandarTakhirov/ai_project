import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatEvent>(
      (event, emit) => event.map(
        send: (value) => _onSend(value, emit),
        rest: (value) => _onRest(value, emit),
        stop: (value) => _onStop(value, emit),
        addFromModel: (value) => _onAddFromModel(value, emit),
      ),
    );
  }

  Future<void> _onSend(
    _SendEvent value,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      emit(
        state.copyWith(
          contents: state.contents.toList()
            ..add(
              Content(
                role: "user",
                parts: [Parts(text: value.text)],
              ),
            ),
          isLoading: false,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          error: "$_",
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onRest(_RestartEvent value, Emitter<ChatState> emit) async {}

  Future<void> _onStop(_StopEvent value, Emitter<ChatState> emit) async {}

  Future<void> _onAddFromModel(
    _AddFromModel value,
    Emitter<ChatState> emit,
  ) async {
    if (value.content == null || (value.content?.parts?.isEmpty ?? true)) {
      return;
    }
    final contents = state.contents.toList();
    if (contents.last.role == "model") {
      contents.last.parts?.addAll(value.content?.parts ?? []);
      emit(state.copyWith(contents: contents));
    } else {
      contents.add(value.content!);
      emit(state.copyWith(contents: contents));
    }
  }

  /// UseCases
  void send(String text) => add(ChatEvent.send(text: text));
  void addFromModel(Content? content) => add(
        ChatEvent.addFromModel(content),
      );
}
