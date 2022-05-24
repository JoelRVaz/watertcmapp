//This utitlity allows a class to inherit and control the state of a statecontroller
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParentState<T>{
  StateController stateController;
  ParentState(this.stateController);

  T get state => stateController.state;
  set state(T state) => stateController.state = state;
}
