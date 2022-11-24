import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../screens/meal_details_screen.dart';

class SearchMealCard extends StatelessWidget {
  const SearchMealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(meal.thumb)),
        title: Text(meal.name),
        trailing: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(meal)));
          },
        ),
      ),
    );
  }
}
