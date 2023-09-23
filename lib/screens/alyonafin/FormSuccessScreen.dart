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
          child: const Column(
            children: [
              Text(
                "Form Submission Successful",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Form No [097614] submmited successfully and we have recieved it. Our verification team at Alyona MicroFinance is looking at details, we will get in touch with you soon..",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              SizedBox(height: 25),
              Icon(Icons.one_k)
            ],
          ),
        ),
      ),
    );
  }
}
