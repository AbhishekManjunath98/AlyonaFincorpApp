// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

//Pinputs box states customization

final defaultPinTheme = PinTheme(
  width: 46,
  height: 46,
  textStyle: const TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
        color: const Color.fromARGB(255, 120, 118, 118),
        width: 2,
        style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //border: Border.all(color: Color.fromARGB(255, 178, 232, 180)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    //color: const Color.fromARGB(255, 178, 232, 180),
  ),
);

Widget isoWidget() {
  return Container(
    child: const Column(
      children: [
        Text(
          "Alyona Microfinance",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(
          "[Governemet Registered NBFC Company]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        ),
        Text(
          "[An ISO 9008:2015 Certified]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        )
      ],
    ),
  );
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Welcome Agent...",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Enter the 6-Digit secret Agent code provided to you by Alyona Finance Team",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 25),
                  pinputWidget(),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () {},
                        child: const Text(
                          "Verify Code",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        )),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Note: Never share your secret agent code with someone. Agent code is strictly prohibited to you by Alyona Finance",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Column(
                children: [const SizedBox(height: 45), isoWidget()],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Pinput pinputWidget() {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: 6,
      obscureText: true,
      obscuringCharacter: "*",
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      closeKeyboardWhenCompleted: true,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
