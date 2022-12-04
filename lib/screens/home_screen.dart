import 'package:flutter/material.dart';
import 'package:tastebite/helpers/colors.dart';
import 'package:tastebite/widgets/sections/home_screen/categories_section.dart';
import 'package:tastebite/widgets/sections/home_screen/dishes_section.dart';

import '../widgets/sections/home_screen/header_section.dart';
import '../widgets/ui/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TasteBiteAppBar('Home'),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageHeaderSection(),
              DishesSection(
                title: 'Super Delicious',
                category: 'Miscellaneous',
              ),
              DishesSection(
                title: 'Sweet Tooth',
                category: 'Dessert',
              ),
              CategoriesSection(),
              Container(
                color: CustomColors.primaryColor[100],
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 35),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        'Deliciousness to your inbox',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 220,
                      child: const Text(
                        'Enjoy weekly hand picked recipes and recommendations',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: TextField(
                        controller: _textEditingController,
                        style: const TextStyle(fontSize: 14),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: InputDecoration(
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 35,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          print(_textEditingController.text);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.primaryColor),
                        ),
                        child: const Text(
                          'JOIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'By joining our newsletter you agree to our ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: CustomColors.primaryColor),
                          )
                        ],
                      ),
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
