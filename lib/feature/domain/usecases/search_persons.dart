import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class SearchPersons extends UseCase<List<PersonEntity>, SearchPersonsParams> {
  final PersonRepository personRepository;

  SearchPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(
      SearchPersonsParams params) async {
    return await personRepository.searchPerson(params.queryName);
  }
}

class SearchPersonsParams extends Equatable {
  final String queryName;

  SearchPersonsParams({required this.queryName});

  @override
  List<Object?> get props => [queryName];
}
