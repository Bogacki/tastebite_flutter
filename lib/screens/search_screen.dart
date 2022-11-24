import 'package:flutter/material.dart';
import 'package:tastebite/models/meal.dart';
import 'package:tastebite/providers/api_connector.dart';

import '../widgets/ui/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = false;
  TextEditingController searchFieldController = TextEditingController();

  List<Widget> mealCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TasteBiteAppBar('Search'),
      body: Column(
        children: [
          TextField(
            controller: searchFieldController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async {
                  final response = await ApiConnector.createSearchMealCards(
                      searchFieldController.text);
                  setState(() {
                    mealCards = response;
                  });
                },
                icon: Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 10),
              hintText: 'Search by Meal/Category/Ingredient',
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView(
                    children: mealCards,
                  ),
                ),
        ],
      ),
    );
  }
}
