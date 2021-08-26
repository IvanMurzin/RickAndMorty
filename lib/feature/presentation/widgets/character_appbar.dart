import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: Text(
        "Character",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
