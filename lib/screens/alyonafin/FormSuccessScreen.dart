import 'package:flutter/material.dart';

class FormSuccessScreen extends StatefulWidget {
  const FormSuccessScreen({super.key});

  @override
  State<FormSuccessScreen> createState() => _FormSuccessScreenState();
}

class _FormSuccessScreenState extends State<FormSuccessScreen> {
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
                "Form Submission Successful",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Form No [097614] submmited successfully and we have recieved it. Our verification team at Alyona MicroFinance is looking at details, we will get in touch with you soon..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 94, 94), fontSize: 14),
                ),
              ),
              const SizedBox(height: 25),
              Image.asset(
                "assets/images/check.png",
                height: 70,
                width: 70,
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Confirmation OTP sent on the customer \n [Ramesh Kumar] mobile number [9834760987], future communications will be assigned here only.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
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
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
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
                          const BorderSide(color: Colors.green)),
                      overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 148, 211, 151)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Fill New Application",
                      style: TextStyle(
                          color: Colors.green,
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
