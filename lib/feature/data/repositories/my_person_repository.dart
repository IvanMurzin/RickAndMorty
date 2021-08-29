import 'package:rick_and_morty/feature/data/datasoucres/person_remoute_data_source.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class MyPersonReposytory implements PersonRepository {
  final PersonRemoteDataSource remoteData;
  //final PersonLocalDataSource localData;

  MyPersonReposytory(
    this.remoteData,
    //this.localData,
  );

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    try {
      final result = await remoteData.getAllPersons(page);
      return Right(result);
    } catch (exception) {
      print(exception);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    try {
      final result = await remoteData.searchPersons(query);
      return Right(result);
    } catch (exception) {
      print(exception);
      return Left(ServerFailure());
    }
  }
}
