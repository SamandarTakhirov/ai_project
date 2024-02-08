part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.send({
    required String text,
  }) = _SendEvent;

  const factory ChatEvent.rest() = _RestartEvent;

  const factory ChatEvent.stop() = _StopEvent;

  const factory ChatEvent.addFromModel(Content? content) = _AddFromModel;
}
