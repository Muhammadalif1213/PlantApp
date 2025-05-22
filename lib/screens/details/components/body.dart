import 'package:app_plant/constants.dart';
import 'package:app_plant/screens/details/components/image_and_icons.dart';
import 'package:app_plant/screens/details/components/title_and_price.dart';
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
          TitleAndPrice(
            title: "Petunia",
            country: "Indonesia",
            price: 50000,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 75,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Description",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
