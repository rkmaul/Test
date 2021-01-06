import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("Simple Bloc Observer Transition works");
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print("Simple Bloc Observer Error");
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
