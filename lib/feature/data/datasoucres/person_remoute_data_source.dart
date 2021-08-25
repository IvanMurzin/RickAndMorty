import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_mode.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  /// calls the https://rickandmortyapi.com/api/character?page=1 endpoint.
  ///
  /// throws a [ServerException] for all error codes
  Future<List<PersonModel>> getAllPersons(int page);

  /// calls the https://rickandmortyapi.com/api/character?name=rick endpoint.
  ///
  /// throws a [ServerException] for all error codes
  Future<List<PersonModel>> searchPersons(String queryName);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonsFromUrl(
      "https://rickandmortyapi.com/api/character?page=$page");

  @override
  Future<List<PersonModel>> searchPersons(String query) => _getPersonsFromUrl(
      "https://rickandmortyapi.com/api/character?name=$query");

  Future<List<PersonModel>> _getPersonsFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else
      throw ServerException();
  }
}
