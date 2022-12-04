import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../../helpers/colors.dart';

import 'dart:math';

class Header extends StatelessWidget {
  Header({required this.meal, required this.showPopularity});

  final Meal meal;
  final bool showPopularity;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              meal.thumb,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showPopularity
                      ? Row(children: [
                          Text(
                              '${Random().nextInt(100)}% Would make this again'),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.show_chart_sharp,
                            color: CustomColors.primaryColor,
                          )
                        ])
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    meal.name,
                    style: Theme.of(context).textTheme.headline1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
