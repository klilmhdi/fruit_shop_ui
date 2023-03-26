import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop_ui/components.dart';
import 'package:fruit_shop_ui/data/data.dart';
import 'package:fruit_shop_ui/colors.dart';
import 'package:fruit_shop_ui/utils.dart';


class DetailsPage extends StatefulWidget {
  final Product product;

  const DetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // product image
          Container(
            height: size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          // top buttons
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: iconWidget(FontAwesomeIcons.bagShopping, true),
                ),
              ],
            ),
          ),
          // product details
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: size.height * 0.50,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // decrease quantity
                              quantityIcon(
                                onTap: () {
                                  if (itemCount > 1) {
                                    setState(() => itemCount--);
                                  }
                                },
                                color: kSecondaryColor,
                                icon: FontAwesomeIcons.minus,
                              ),

                              // quantity count
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // increase quantity
                              quantityIcon(
                                onTap: () {
                                  setState(() => itemCount++);
                                },
                                color: kPrimaryColor,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // product nutrients details
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return NutrientWidget(
                          product: data[0].products![index],
                          index: index,
                        );
                      },
                    ),

                    // product description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
