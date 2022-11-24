import 'package:flutter/material.dart';
import 'package:tastebite/widgets/ui/custom_app_bar.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TasteBiteAppBar('Favourites'),
      body: const Center(
        child: Text('test'),
      ),
    );
  }
}
