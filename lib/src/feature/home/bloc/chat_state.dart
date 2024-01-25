part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<Content> contents,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _ChatState;
}
