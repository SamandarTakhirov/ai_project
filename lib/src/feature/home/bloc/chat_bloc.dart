import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  static final _gemini = Gemini.instance;
  static StreamSubscription? streamSubscription;

  ChatBloc() : super(const ChatState()) {
    on<ChatEvent>((event, emit) => event.map(
          send: (value) => _onSend(value, emit),
          rest: (value) => _onRest(value, emit),
          stop: (value) => _onStop(value, emit),
        ));
  }

  Future<void> _onSend(_SendEvent value, Emitter<ChatState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      emit(state.copyWith(
        contents: state.contents.toList()
          ..add(Content(
            role: "user",
            parts: [Parts(text: value.text)],
          )),
      ));
      await streamSubscription?.cancel();
      final strem = _gemini.streamChat(
        state.contents,
        generationConfig: GenerationConfig(),
      );
      strem.listen((event) {
        print(event.output);
      });
      await for (final event in strem) {
        List<Content> contents = [];
        if (state.contents.isNotEmpty &&
            state.contents.last.role == event.content?.role) {
          contents = state.contents.toList();
          contents.last.parts!.last.text =
              "${state.contents.last.parts!.last.text}${event.output}";
          emit(
            state.copyWith(contents: contents),
          );
        } else {
          contents = state.contents.toList()
            ..add(
              Content(
                role: "model",
                parts: [Parts(text: event.output)],
              ),
            );
          emit(
            state.copyWith(contents: contents),
          );
        }
      }
    } catch (_) {
      emit(state.copyWith(
        error: "$_",
        isLoading: false,
      ));
    }
  }

  Future<void> _onRest(_RestartEvent value, Emitter<ChatState> emit) async {}

  Future<void> _onStop(_StopEvent value, Emitter<ChatState> emit) async {}
}
