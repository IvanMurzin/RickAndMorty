import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/character_state.dart';
import 'package:rick_and_morty/feature/presentation/pages/character_page.dart';

class CharacterCard extends StatelessWidget {
  final int index;

  const CharacterCard(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is OnLoadedState) {
          final person = state.persons[index];
          var statusColor = Colors.green;
          if (person.status == "Dead") statusColor = Colors.red;
          if (person.status == "unknown") statusColor = Colors.grey;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CharacterPage(person)),
              );
            },
            child: Card(
              color: Color.fromRGBO(60, 61, 66, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    child: Image(
                      width: 170,
                      height: 170,
                      image: NetworkImage(person.image),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          person.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: new BoxDecoration(
                                color: statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${person.status} - ${person.species}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Last known location:",
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                        SizedBox(height: 4),
                        Text(
                          person.location.name,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Origin:",
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                        SizedBox(height: 4),
                        Text(
                          person.origin.name,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
