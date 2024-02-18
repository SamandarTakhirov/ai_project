import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ObServer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("${change.currentState} to ${change.nextState}");
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
  }
}
