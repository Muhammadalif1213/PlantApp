import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendedCard(
            image: "assets/images/Flower1.jpg",
            title: "Petunia",
            country: "Indonesia",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
            price: 50000,
          ),
          RecomendedCard(
            image: "assets/images/Flower2.jpg",
            title: "Mawar",
            country: "UK",
            press: () {
            },
            price: 100000,
          ),
          RecomendedCard(
            image: "assets/images/Flower3.jpg",
            title: "Hibiscus",
            country: "USA",
            press: () {},
            price: 150000,
          ),
        ],
      ),
    );
  }
}

class RecomendedCard extends StatelessWidget {
  const RecomendedCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  });

  final String image, title, country;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width * 0.4,
            height: 160,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Rp.$price",
                    style:
                        Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: kPrimaryColor,
                        ) ??
                        TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
