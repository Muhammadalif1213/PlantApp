import 'package:app_plant/constants.dart';
import 'package:flutter/material.dart';

class FeatureItems extends StatelessWidget {
  const FeatureItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeatureItemCard(image: "assets/images/Flower1.jpg", press: () {}),
          FeatureItemCard(image: "assets/images/Flower2.jpg", press: () {}),
        ],
      ),
    );
  }
}

class FeatureItemCard extends StatelessWidget {
  const FeatureItemCard({super.key, required this.image, required this.press});

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding
      ),
      child: Container(
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
