import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop_ui/data/data.dart';
import 'package:fruit_shop_ui/colors.dart';
import 'package:fruit_shop_ui/utils.dart';

Widget quantityIcon({required VoidCallback onTap, required Color color, required IconData icon}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
        size: 20,
      ),
    ),
  );
}

Widget NutrientWidget({required Product product, required int index}) => Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${product.nutrients[index][1]}/5",
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // building the indicators
          Row(
            children: buildIndicators(
              product.nutrients[index][0],
              int.parse(product.nutrients[index][1]), product),
          ),
        ],
      ),
    );

List<Widget> buildIndicators(String nutrientType, int value, Product product) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        i < value
            ? indicator(true, nutrientType, product)
            : indicator(false, nutrientType, product),
      );
    }
    return list;
  }

Widget indicator(bool isActive, String nutrientType, Product product) {
    IconData icon;
    switch (nutrientType) {
      case "Energy":
        icon = FontAwesomeIcons.bolt;
        break;
      case "Freshness":
        icon = FontAwesomeIcons.glassWater;
        break;
      case "Vitamin":
        icon = Icons.rocket_launch_rounded;
        break;
      default:
        icon = FontAwesomeIcons.fire;
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
      child: Icon(
        icon,
        color: isActive == true ? product.nutrientsColor : Colors.black12,
        size: 16,
      ),
    );
  }

Widget ProductWidget({required Product product}) => Container(
      color: product.color,
      child: Stack(
        children: [
          // image of product
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),
          // heart icon
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: boxShadow,
              ),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color:
                product.isSelected == true ? kPrimaryColor : Colors.black38,
                size: 15,
              ),
            ),
          ),
          // product details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  // product based box shadow
                  BoxShadow(
                    color: product.color.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  priceWidget(product.price),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text("See More"),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.arrowTrendUp,
                        color: kPrimaryColor,
                        size: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
);

Widget priceWidget(String price) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "\$$price",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(
          text: " /kg",
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

Widget iconWidget(IconData icon, bool dotExists) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: boxShadow,
      shape: BoxShape.circle,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(icon),
        if (dotExists)
          Positioned(
            right: 12,
            top: 15,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    ),
  );
}
