import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => throw UnimplementedError();
}


class WelcomeState extends CubitStates {
  @override
  List<Object> get props => throw UnimplementedError();
} 

class LoadingState extends CubitStates {
  @override
  List<Object> get props => throw UnimplementedError();
}
class LoadedState extends CubitStates {
  @override
  List<Object> get props => throw UnimplementedError();
}
