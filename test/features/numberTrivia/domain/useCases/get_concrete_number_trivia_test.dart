import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_in_action/features/numberTrivia/domain/entities/number_trivia.dart';
import 'package:flutter_architecture_in_action/features/numberTrivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_architecture_in_action/features/numberTrivia/domain/useCases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia useCase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    //先用传统的手动执行 Constructor 的方式来注入依赖
    //TODO 后面使用 git_it 来做
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final testNum = 1;
  final testNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia(entity) for the number(input) from the repository',
    () async {
      //arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(testNumberTrivia));
      //act
      final result = await useCase.execute(num: testNum);
      //assert
      expect(result, Right(testNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(testNum));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
