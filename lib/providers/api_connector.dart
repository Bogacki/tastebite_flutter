import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/ui/search_meal_card.dart';

abstract class ApiConnector {
  static Future<List<Meal>> getMealsByCategory(String category) async {
    List<Meal> mealsToDisplay = [];
    try {
      final url = Uri.parse('${Constants.mealUrl}/filter.php?c=$category');
      final response = await http.get(url);
      final decodedDessertsResponse = jsonDecode(response.body);
      final List<dynamic> mealsList = decodedDessertsResponse['meals'];
      for (var meal in mealsList.take(10)) {
        mealsToDisplay.add(Meal(
          meal['idMeal'],
          meal['strMeal'],
          meal['strMealThumb'],
        ));
      }
      return mealsToDisplay;
    } catch (error) {
      rethrow;
    }
  }

  static Future<Meal> getMealById(String id) async {
    try {
      final url = Uri.parse('${Constants.mealUrl}/lookup.php?i=$id');
      final response = await http.get(url);
      final decodedDessertsResponse = jsonDecode(response.body);
      final dynamic extractedMeal = decodedDessertsResponse['meals'][0];
      final Meal meal = Meal(
        extractedMeal['idMeal'],
        extractedMeal['strMeal'],
        extractedMeal['strMealThumb'],
      );
      meal.area = extractedMeal['strArea'];
      meal.instructions = extractedMeal['strInstructions'];
      meal.youtube = extractedMeal['strYoutube'];
      int iterator = 1;
      String iteratedIngredient;
      String iteratedMeasure;
      do {
        iteratedIngredient = extractedMeal['strIngredient$iterator'];
        iteratedMeasure = extractedMeal['strMeasure$iterator'];
        iterator++;
        if (iteratedIngredient.isNotEmpty) {
          meal.ingredients.add(iteratedIngredient);
          meal.measures.add(iteratedMeasure);
        }
      } while (iteratedIngredient.isNotEmpty);
      return meal;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Meal>> getMealsByName(String name) async {
    List<Meal> mealsToDisplay = [];
    try {
      final url = Uri.parse('${Constants.mealUrl}/search.php?s=$name');
      final response = await http.get(url);
      final decodedDessertsResponse = jsonDecode(response.body);
      final List<dynamic>? mealsList = decodedDessertsResponse['meals'];
      if (mealsList == null) return [];
      for (var meal in mealsList.take(10)) {
        mealsToDisplay.add(
          Meal(
            meal['idMeal'],
            meal['strMeal'],
            meal['strMealThumb'],
          ),
        );
      }
      return mealsToDisplay;
    } catch (error) {
      rethrow;
    }
  }

  static Future<Meal> getRandomMeal() async {
    final headerMealUrl = Uri.parse('${Constants.mealUrl}/random.php');
    final responseHeaderMeal = await http.get(headerMealUrl);
    final decodedHeaderMealResponse = jsonDecode(responseHeaderMeal.body);
    final Map<String, dynamic> extractedMeal =
        decodedHeaderMealResponse['meals'][0];
    Meal headerMeal = Meal(
      extractedMeal['idMeal'],
      extractedMeal['strMeal'],
      extractedMeal['strMealThumb'],
    );
    return headerMeal;
  }

  static Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    try {
      final url = Uri.parse('${Constants.mealUrl}/categories.php');
      final response = await http.get(url);
      final decodedResponse = jsonDecode(response.body);
      final List<dynamic> extractedCategories = decodedResponse['categories'];
      for (var extractedCategory in extractedCategories) {
        Category category = Category(
            extractedCategory['idCategory'],
            extractedCategory['strCategory'],
            extractedCategory['strCategoryThumb'],
            extractedCategory['strCategoryDescription']);
        categories.add(category);
      }
      return categories;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Widget>> createSearchMealCards(String search) async {
    List<Meal> meals = await getMealsByName(search);
    List<Widget> mealCards = [];
    for (var meal in meals) {
      mealCards.add(
        SearchMealCard(meal: meal),
      );
    }
    return mealCards;
  }
}
