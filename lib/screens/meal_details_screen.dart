import 'package:flutter/material.dart';
import 'package:tastebite/providers/api_connector.dart';

import '../models/meal.dart';
import '../widgets/ui/custom_app_bar.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen(this.meal);
  Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: ApiConnector.getMealById(meal.id),
        builder: ((context, snapshot) {
          return Center(
            child: Text('Test'),
          );
        }),
      ),
    );
  }
}
