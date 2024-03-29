import 'package:bloc/bloc.dart';

class ObServer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print("${change.currentState} to ${change.nextState}");
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error.toString());
    print(stackTrace.toString());
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
  }
}
