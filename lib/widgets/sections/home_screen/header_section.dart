import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tastebite/models/meal.dart';

import '../../../providers/api_connector.dart';
import '../../../widgets/ui/shimmer_container.dart';
import '../../../screens/meal_details_screen.dart';
import '../../ui/header.dart';

class HomePageHeaderSection extends StatelessWidget {
  HomePageHeaderSection();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiConnector.getRandomMeal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer(
            period: const Duration(seconds: 5),
            direction: ShimmerDirection.ltr,
            gradient: const LinearGradient(
              colors: [
                Colors.black12,
                Colors.white,
              ],
            ),
            child: ShimmerContainer(height: 340, width: double.infinity),
          );
        }
        if (snapshot.error != null) {
          throw Exception(snapshot.error);
        }

        final meal = snapshot.data as Meal;
        return GestureDetector(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(meal)));
          }),
          child: Header(
            meal: meal,
            showPopularity: true,
          ),
        );
      },
    );
  }
}
