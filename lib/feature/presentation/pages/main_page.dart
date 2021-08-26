import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:rick_and_morty/feature/data/datasoucres/person_remoute_data_source.dart';
import 'package:rick_and_morty/feature/data/repositories/my_person_repository.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/feature/presentation/widgets/main_appbar.dart';
import 'package:rick_and_morty/feature/presentation/widgets/character_list.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Client client = Client();
    final PersonRemoteDataSource remoteData =
        MyPersonRemoteDataSource(client: client);
    final PersonRepository personRepository = MyPersonReposytory(remoteData);
    
    return BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc(personRepository),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(37, 40, 47, 1),
        appBar: MainAppBar(),
        body: CharacterList(),
      ),
    );
  }
}
