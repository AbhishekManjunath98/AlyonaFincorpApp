import 'package:flutter/material.dart';

class FormFailureScreen extends StatefulWidget {
  const FormFailureScreen({super.key});

  @override
  State<FormFailureScreen> createState() => _FormFailureScreenState();
}

class _FormFailureScreenState extends State<FormFailureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                "Form Submission Failed",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Form No [097614] submmited failed and we have recieved it. There is some error with data try filling the from again..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 94, 94), fontSize: 14),
                ),
              ),
              const SizedBox(height: 25),
              Image.asset(
                "assets/images/failed.png",
                height: 70,
                width: 70,
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Some error occured with the form we request you to check the data and fill the form again with utmost care.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 50,
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    child: const Text(
                      "Go Home Screen",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 50,
                child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.red)),
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 239, 160, 154)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Try Again",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
