import 'package:flutter/material.dart';

import '../const/colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Center(child: Text("Favorite Screen")),
    );
  }
}
