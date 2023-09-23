import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappuiclone/screens/alyonafin/EnterCodeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Start a timer to navigate to the next screen after 5 seconds.
    Timer(const Duration(seconds: 6), () {
      // Navigate to the next screen.
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const EnterCodeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: splashWidget(),
      ),
    );
  }

  Widget splashWidget() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Center(heightFactor: 5, child: logoWidget2()),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Powerd By Evokeup Technologies Pvt Ltd",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ));
  }

  Widget logoWidget2() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(80))),
          child: Image.asset(
            "assets/images/alyonaicon.jpeg",
            height: 90,
            width: 90,
          ),
        ),
        const Text(
          "Alyona MicroFinance",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
        ),
        const Text(
          "[Governemet Registered NBFC Company]",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const Text(
          "[An ISO 9008:2015 Certified]",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }

  static Column logoWidget() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(80))),
          child: Image.asset(
            "assets/images/alyonaicon.jpeg",
            height: 70,
            width: 70,
          ),
        ),
        const Text(
          "Alyona Microfinance",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const Text(
          "[Governemet Registered NBFC Company]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        ),
        const Text(
          "[An ISO 9008:2015 Certified]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        )
      ],
    );
  }
}
