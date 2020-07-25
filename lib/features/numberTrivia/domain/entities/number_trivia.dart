import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  //data field
  final String text;
  final int number;

  //method
  NumberTrivia({
    @required this.text,
    @required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
