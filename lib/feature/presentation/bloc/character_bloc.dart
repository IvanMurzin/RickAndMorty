import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final PersonRepository personRepository;

  CharacterBloc(this.personRepository) : super(OnLoadingState());

  int page = 0;
  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is OnLoadNextEvent) page++;
    final result = await personRepository.getAllPersons(page);
    CharacterState state = OnExceptionState();
    result.fold(
      (exception) => print(exception),
      (persons) {
        state = OnLoadedState(persons);
      },
    );
    yield state;
  }
}
