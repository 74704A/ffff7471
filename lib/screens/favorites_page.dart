import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: Center(
        child: Text("Your favorite items go here.", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
