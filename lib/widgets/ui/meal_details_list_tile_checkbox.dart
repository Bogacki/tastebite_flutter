import 'package:flutter/material.dart';
import '../../models/ingredient.dart';

class MealDetailsCheckboxListTile extends StatelessWidget {
  MealDetailsCheckboxListTile(this.ingredient, this.onChanged);
  Ingredient ingredient;
  dynamic onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: onChanged,
        value: ingredient.checked,
      ),
      title: Text(
        ingredient.ingredient,
        style: TextStyle(
            decoration: ingredient.checked
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      subtitle: Text(
        ingredient.measure,
        style: TextStyle(
            decoration: ingredient.checked
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
    );
  }
}
