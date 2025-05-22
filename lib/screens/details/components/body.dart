import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/details/components/image_and_icons.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size),
        ],
      ),
    );
  }
}
