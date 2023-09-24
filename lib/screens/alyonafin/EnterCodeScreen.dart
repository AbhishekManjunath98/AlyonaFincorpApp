// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsappuiclone/screens/HomeScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/FillFormScreen.dart';

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
  border: Border.all(color: Colors.green),
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
  var passcodesArray = [
    '88UNFW',
    'OAJXII',
    'IUTNXM',
    'BCKLQO',
    'VTM4JT',
    'B93AFI',
    'OATYZU',
    'I489KB',
    'GOL3TB',
    'S2332B',
    'XO74KM',
    'R8UAOD',
    'A6F5TX',
    'S0QT51',
    '0SSE7G',
    'E0U5JI',
    '680IJD',
    'HRPZDE',
    'GMFDEW',
    '8K9DFR',
    'RT7QPE',
    'CMKUXX',
    'Q0AR7I',
    'VUI59V',
    'RTUWOT',
    'SLDV9C',
    '7JPPK2',
    '7UWA46',
    'ZQFT3B',
    '66PD72'
  ];
  final inputPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 15, right: 15),
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
                  verifyButton(context),
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

  Future<String?> successDialog() {
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/check.png",
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Code Verified Successfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Congrats your Agent code verified successfully. Now you are all set to fill new application forms for custmoers.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 97, 94, 94),
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeScreen()));
                          },
                          child: const Text(
                            "Fill New Application",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )),
                    ),
                    const SizedBox(height: 20),
                    logoWidget()
                  ],
                ))));
  }

  Future<String?> failureDialog() {
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/failed.png",
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Code Verification Failed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Agent code you entered is incorrect and cannot be used to onboard you as agent. Contact Alyora Fincorp for help if needed.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 97, 94, 94),
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Try Again",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )),
                    ),
                    const SizedBox(height: 20),
                    logoWidget()
                  ],
                ))));
  }

  void showSnackBar(
      {required String type, required String msg, int? duration}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(
      backgroundColor: type == "f" ? Colors.red : Colors.green,
      duration: Duration(seconds: duration ?? 8),
      content: Text(
        msg,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      ),
    );

    scaffoldMessenger.showSnackBar(snackBar);
  }

  void validatePasscode() {
    if (inputPassword.text.length < 6) {
      showSnackBar(
          type: "f",
          msg: "Please enter a Valid Agent Code to Verify...",
          duration: 4);
      return;
    }
    if (passcodesArray.contains(inputPassword.text)) {
      successDialog();
    } else {
      failureDialog();
    }
  }

  Widget verifyButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 50,
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            validatePasscode();
          },
          child: const Text(
            "Verify Code",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          )),
    );
  }

  Widget logoWidget() {
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

  Pinput pinputWidget() {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: 6,
      obscureText: false,
      obscuringCharacter: "*",
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      closeKeyboardWhenCompleted: true,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      showCursor: true,
      controller: inputPassword,
      onCompleted: (pin) => print(pin),
    );
  }
}
