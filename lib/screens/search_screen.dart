import 'package:flutter/material.dart';
import 'package:tastebite/helpers/colors.dart';
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
  static const _searchType = ['Meal name', 'Category', 'Ingredient', 'Area'];
  String _selectedSearchType = _searchType[0];

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
                  mealCards = await ApiConnector.createSearchMealCards(
                      searchFieldController.text, _selectedSearchType);
                  setState(() {});
                },
                icon: Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.only(top: 15, left: 20, bottom: 10),
              hintText: 'Search by $_selectedSearchType',
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _searchType.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionChip(
                    label: Text(_searchType[index]),
                    backgroundColor: _selectedSearchType == _searchType[index]
                        ? CustomColors.primaryColor
                        : Colors.black12,
                    onPressed: () {
                      _selectedSearchType = _searchType[index];
                      setState(() {});
                    },
                  ),
                );
              },
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
