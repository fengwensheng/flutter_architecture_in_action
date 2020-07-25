import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_in_action/core/error/failures.dart';
import 'package:flutter_architecture_in_action/features/numberTrivia/domain/entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia {
  //data field
  //传入一个repository的实现类 data层内 concrete/random
  final NumberTriviaRepository numberTriviaRepository;
  //method
  GetConcreteNumberTrivia(this.numberTriviaRepository);

  Future<Either<Failure, NumberTrivia>> execute({
    @required int num,
  }) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(num);
  }
}
