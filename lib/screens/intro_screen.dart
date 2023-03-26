import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop_ui/colors.dart';
import 'package:fruit_shop_ui/screens/home_screen.dart';
import 'package:slider_button/slider_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "PRINCE Markets",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.1,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "First Online",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "Market",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/bg.png"),
              ),
              // const Spacer(),
              SizedBox(height: 90.0),
              Center(
                child: SliderButton(
                    action: () => Timer(
                          const Duration(milliseconds: 500),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          ),
                        ),
                    label: Text(
                      "SWIPE TO START",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    buttonColor: kPrimaryColor,
                    icon: Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 20,
                      color: Colors.white,
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
