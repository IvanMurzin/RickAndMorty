import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/character_appbar.dart';

class CharacterPage extends StatelessWidget {
  final PersonEntity person;

  const CharacterPage(this.person);

  @override
  Widget build(BuildContext context) {
    var statusColor = Colors.green;
    if (person.status == "Dead") statusColor = Colors.red;
    if (person.status == "unknown") statusColor = Colors.grey;
    return Scaffold(
      appBar: CharacterAppBar(),
      backgroundColor: Color.fromRGBO(37, 40, 47, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Text(
              person.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image(
              width: 250,
              height: 250,
              image: NetworkImage(person.image),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: new BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "${person.status}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Gender:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              person.gender,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "Number of episodes:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              "${person.episode.length}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "Species:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              person.species,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "Last known location:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              person.location.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Origin:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              person.origin.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "Was created:",
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              person.created.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
