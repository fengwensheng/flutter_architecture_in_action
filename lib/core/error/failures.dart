import 'package:equatable/equatable.dart';

//a part of Repositories, so...
abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
  @override
  List<Object> get props => [];
}
