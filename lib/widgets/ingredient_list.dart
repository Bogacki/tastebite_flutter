import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/ui/meal_details_list_tile_checkbox.dart';

class IngredientsList extends StatefulWidget {
  const IngredientsList({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: widget.meal.ingredients.length,
          itemBuilder: (context, index) {
            final ingredient = widget.meal.ingredients[index];
            return MealDetailsCheckboxListTile(ingredient, (newValue) {
              setState(() {
                ingredient.checked = newValue!;
                widget.meal.ingredients.sort((a, b) => a.checked ? 1 : -1);
              });
            });
          }),
    );
  }
}
