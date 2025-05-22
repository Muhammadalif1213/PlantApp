import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/home/home_screen.dart';
import 'package:app_plant/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileBottomNavBar extends StatelessWidget {
  const ProfileBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(Icons.home_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Icon(Icons.person_3),
          ),
        ],
      ),
    );
  }
}
