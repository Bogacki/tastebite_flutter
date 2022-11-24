import 'package:flutter/material.dart';

import '../widgets/ui/custom_app_bar.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TasteBiteAppBar(''),
      body: const Center(
        child: Text('test'),
      ),
    );
  }
}
