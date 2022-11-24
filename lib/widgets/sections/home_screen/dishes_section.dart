import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../providers/api_connector.dart';
import '../../ui/dishes_section_shimmer.dart';
import '../../ui/meals_horizontal_list.dart';

class DishesSection extends StatelessWidget {
  DishesSection({Key? key, required this.title, required this.category})
      : super(key: key);

  final String title;
  final String category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiConnector.getMealsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DishesSectionShimmer();
          }
          if (snapshot.error != null) {
            log('Couldn\'t get the data');
            return const DishesSectionShimmer();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MealsHorizontalList(snapshot.data! ?? [])
            ],
          );
        });
  }
}
