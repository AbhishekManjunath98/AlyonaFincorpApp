import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappuiclone/screens/alyonafin/EnterCodeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

void redirectHomeScreen(BuildContext context) {
  Timer(const Duration(seconds: 6), () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EnterCodeScreen()));
  });
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    redirectHomeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15.0),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            brandingIcon(),
            const SizedBox(height: 30),
            downtext()
          ],
        )),
      ),
    );
  }

  Widget downtext() {
    return const Column(
      children: [
        Text(
          "Note : Loan processing fee will not be refunded and we at Alyona Finance don't guarntee loan approval. Read our Privacy Policy and Terms & Conditions for more info inside the app",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 52, 50, 50), fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget brandingIcon() {
    return Column(
      children: [
        Image.asset(
          "assets/images/alyonatrans.png",
          height: 200,
          width: 200,
        ),
        const SizedBox(height: 6),
        const Text(
          "© AlyonaFinance® NBFC",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const Text(
          "An ISO 2015:9001 Certified",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
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
