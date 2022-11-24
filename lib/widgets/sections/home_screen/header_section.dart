import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helpers/colors.dart';
import '../../../providers/api_connector.dart';
import '../../../widgets/ui/shimmer_container.dart';
import '../../../screens/meal_details_screen.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection();
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

        final meal = snapshot.data;
        return GestureDetector(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(meal)));
          }),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Image.network(
                    meal!.thumb,
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,
                    loadingBuilder: ((context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: LinearProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  color: const Color(0xFFE4F1FF),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                              '${Random().nextInt(100)}% Would make this again'),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.show_chart_sharp,
                            color: CustomColors.primaryColor,
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          meal.name,
                          style: const TextStyle(
                              fontSize: 26,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
