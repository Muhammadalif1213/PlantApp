import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/home/components/feature_items.dart';
import 'package:app_plant/screens/home/components/header_with_searchbox.dart';
import 'package:app_plant/screens/home/components/recomended_Item.dart';
import 'package:app_plant/screens/home/components/title_with_button.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithButton(press: () {}, title: "Recomended"),
          RecomendedItem(),
          TitleWithButton(press: () {}, title: "Featured Plants"),
          FeatureItems(),
          SizedBox(height: kDefaultPadding,)
        ],
      ),
    );
  }
}