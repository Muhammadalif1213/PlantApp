import 'package:app_plant/components/my_bottom_nav_bar.dart';
import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    );
  }
}