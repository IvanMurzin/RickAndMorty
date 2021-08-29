import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_state.dart';
import 'character_card.dart';

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterBloc = BlocProvider.of<CharacterBloc>(context);
    characterBloc.add(OnLoadNextEvent());
    int page = -1;
    List<PersonEntity> storage = [];

    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is OnLoadedState) storage.addAll(state.persons);
        characterBloc.checkNetworkConnectivity().then((success) {
          if (!success) characterBloc.add(OnNetworkLoseEvent());
        });
        return ListView.builder(
          itemCount: storage.length + 1,
          itemBuilder: (context, index) {
            if (index % 20 == 0) {
              int currentPage = index ~/ 20;
              if (currentPage > page) characterBloc.add(OnLoadNextEvent());
              page = currentPage;
            }
            if (index == storage.length)
              return Container(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return CharacterCard(storage[index]);
          },
        );
      },
    );
  }
}
