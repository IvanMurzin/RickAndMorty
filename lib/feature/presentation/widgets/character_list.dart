import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_event.dart';

import 'character_card.dart';

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterBloc = BlocProvider.of<CharacterBloc>(context);
    characterBloc.add(OnOpenEvent());
    return ListView.builder(
      itemBuilder: (context, index) {
        return CharacterCard(index);
      },
    );
  }
}
