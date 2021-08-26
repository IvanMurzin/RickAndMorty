import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

abstract class CharacterState {}

class OnLoadingState extends CharacterState {}
class OnExceptionState extends CharacterState {}

class OnLoadedState extends CharacterState {
  final List<PersonEntity> persons;
  OnLoadedState(this.persons);
}
