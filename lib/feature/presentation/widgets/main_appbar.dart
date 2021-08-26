import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black26,
      title: Text(
        "Characters",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              print("tap");
            },
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
