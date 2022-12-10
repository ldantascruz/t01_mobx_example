import 'package:mobx/mobx.dart';
import 'package:t01_mobx_example/home/home_states.dart';

part 'home_controller.g.dart';

class HomeController extends _HomeController with _$HomeController {}

abstract class _HomeController with Store {
  // late Action increment = Action(_incrementCounter);

  // final _counter = Observable(0);
  // int get counter => _counter.value;

  // void _incrementCounter() {
  //   _counter.value++;
  // }

  @observable
  HomeState state = HomeInitialState();

  @action
  void updateState(HomeState newState) {
    state = newState;
  }

  @observable
  int counter = 0;

  @action
  Future<void> incrementCounter() async {
    try {
      updateState(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      //throw Exception();
      counter++;
      updateState(HomeSuccessState());
    } catch (e) {
      updateState(HomeErrorState());
    }
  }
}
