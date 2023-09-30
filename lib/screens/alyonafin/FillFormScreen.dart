// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyState {
  PreferredSizeWidget appbar;
  Widget drawer;

  MyState(this.appbar, this.drawer);
}

class FillFormScreen extends StatefulWidget {
  const FillFormScreen({super.key});

  @override
  State<FillFormScreen> createState() => _FillFormScreenState();
}

AppBar appbarWidget() {
  return AppBar(
    title: const Text('Alyona MicroFinance'),
  );
}

Widget drawerWidget() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(child: logoWidget()),
        ),
        ListTile(
          title: const Text(
            "Navigate Home",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.home),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Fill New Form(Agents)",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.edit),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Gallery",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.browse_gallery),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Contact Us",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.contact_page),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "About Us",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.person),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Visit Website",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.web),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Email Us",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.contact_mail),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Rate Us On Playstore",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.rate_review),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Terms & Conditions",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.warning),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Exit App",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {},
        )
      ],
    ),
  );
}

Widget logoWidget() {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80))),
        child: Image.asset(
          "assets/images/alyonatrans.png",
          height: 100,
          width: 100,
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

final provider = Provider<MyState>(
  create: (context) => MyState(appbarWidget(), drawerWidget()),
);

class _FillFormScreenState extends State<FillFormScreen> {
  final onSelectionChanged = "";
  String aadharPath = "";
  String panPath = "";
  String jatiPath = "";
  String aawasiyaPath = "";
  String aayPath = "";
  String photoPath = "";
  final inputName = TextEditingController();
  final inputPhone = TextEditingController();
  final inputfathersName = TextEditingController();
  final inputaddress = TextEditingController();
  final inputpinCode = TextEditingController();
  final inputloanAmount = TextEditingController();
  DateRangePickerSelectionChangedArgs? inputDob;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputName.dispose();
    inputfathersName.dispose();
    inputaddress.dispose();
    inputpinCode.dispose();
    inputloanAmount.dispose();
    super.dispose();
  }

  String generateRandomNumber(int length) {
    const digits = '0123456789';
    final random = Random();
    final randomNumber = StringBuffer();
    for (var i = 0; i < length; i++) {
      randomNumber.write(digits[random.nextInt(digits.length)]);
    }
    return randomNumber.toString();
  }

  Future<void> sendDirectBypassedMessage() async {
    String msg = "+918434076005";
    List<String> recepients = [""];
  }

  Future<void> sendFirenaseOtp(String phone) async {
    if (inputPhone.text.isEmpty) {
      showSnackBar(
          type: "f",
          msg: "Mobile Number is Needed to send confirmation OTP!!!");
      return;
    }

    FirebaseAuth.instance
        .verifyPhoneNumber(
          phoneNumber: '+91$phone',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
        )
        .then((value) => {
              print("Otp send successfully on phone number +91$phone"),
              showSnackBar(
                  type: "s",
                  msg: "Otp send successfully on phone number +91$phone")
            })
        .onError((error, stackTrace) => {
              print("Error occured while sending otp : $error"),
              showSnackBar(
                  type: "f", msg: "Error occured while sending otp : $error")
            });
  }

  void flutterMailer() async {
    const GMAIL_SCHEMA = 'com.google.android.gm';

    final MailOptions mailOptions = MailOptions(
      body:
          'Just Now A New Loan Application Was Submitted From App, Here are Deatails : <BR><BR> Applicant Name : ${inputName.text}<BR> Father Name : ${inputfathersName.text}<BR> Address : ${inputaddress.text}<BR><BR> Phone Number : ${inputPhone.text} <BR><BR> Pin Code : ${inputpinCode.text}<BR> Loan Amount : ${inputloanAmount.text}<BR> Date of Birth : ${inputDob!.value.startDate.toString()}<BR> Date : ${DateTime.now()}<BR><BR> Below are the attached documents(Aadhar + Pan + Jati + Aaya + Aawasiya + Photo)<BR><BR> Happy Loan Processing<BR> Cheers, Alyona MicroFinance Team<BR> Date : ${DateTime.now()}',
      subject:
          'New Loan Application Recieved [00${generateRandomNumber(6)}] (Alyona MicroFinance)',
      recipients: ['alyonamicrofinance@gmail.com'],
      isHTML: true,
      bccRecipients: ['gunjan@geekforce.in'],
      attachments: [
        aadharPath,
        panPath,
        jatiPath,
        aawasiyaPath,
        aayPath,
        photoPath
      ],
      appSchema: GMAIL_SCHEMA,
    );
    try {
      Future<MailerResponse> mr = FlutterMailer.send(mailOptions);
      print("mr : ${mr.toString()}");
    } on Exception catch (e) {
      print("fluttermailer error : ${e.toString()}");
    }
  }

  void showSnackBar({required String type, required String msg}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(
      backgroundColor: type == "f" ? Colors.red : Colors.green,
      duration: const Duration(seconds: 8),
      content: Text(
        msg,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      ),
    );

    scaffoldMessenger.showSnackBar(snackBar);
  }

  void validateFormDetails() {
    HapticFeedback.vibrate();
    if (inputName.text.isNotEmpty &&
        inputPhone.text.isNotEmpty &&
        inputfathersName.text.isNotEmpty &&
        inputaddress.text.isNotEmpty &&
        inputpinCode.text.isNotEmpty &&
        inputloanAmount.text.isNotEmpty &&
        inputDob!.value.startDate.toString().isNotEmpty &&
        aadharPath != "" &&
        aadharPath != "error" &&
        panPath != "" &&
        panPath != "error" &&
        jatiPath != "" &&
        jatiPath != "error" &&
        aawasiyaPath != "" &&
        aawasiyaPath != "error" &&
        aayPath != "" &&
        aayPath != "error" &&
        photoPath != "" &&
        photoPath != "error") {
      showSnackBar(
          type: "s",
          msg:
              "Now Preparing the Mail..Click Send in Gmail Upper Left Corner to Send this Mail to Alyona MicroFinance..");

      flutterMailer();
    } else {
      showSnackBar(
          type: "f",
          msg:
              "Please Fill All the details..Some Details Are Missing..Check And Try Again!!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "New Loan Application",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              const Text(
                "(Application Id : 0046798598)",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Note it is important to fill this application with correct data so that our team can verify the details and get in touch with you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 94, 94), fontSize: 14),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.topLeft,
                //  margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Personal Details",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Enter full name..',
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.characters,
                controller: inputName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Father full name..',
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.characters,
                controller: inputfathersName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Address..',
                ),
                keyboardType: TextInputType.streetAddress,
                textCapitalization: TextCapitalization.characters,
                controller: inputaddress,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Enter Mobile..',
                ),
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.characters,
                controller: inputPhone,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Pin code..',
                ),
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.characters,
                controller: inputpinCode,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(48.0))),
                  hintText: 'Loan amount',
                ),
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.characters,
                controller: inputloanAmount,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 40,
                child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black)),
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 148, 211, 151)),
                    ),
                    onPressed: () {
                      dobDialog();
                    },
                    child: Text(
                      inputDob != null
                          ? "Date of Birth ${inputDob!.value.startDate.toString().substring(0, 10)}"
                          : "Select Date of Birth",
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.topLeft,
                // margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Personal Documents",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              aadharPath != "" && aadharPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color: aadharPath != "" && aadharPath != "error"
                                  ? Colors.green
                                  : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              aadharPath = value!.files.first.path!;
                              print("aadharPath : $aadharPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              aadharPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Aadhar",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: aadharPath != "" && aadharPath != "error"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
                        )),
                  ),
                  Visibility(
                    visible: aadharPath != "" && aadharPath != "error"
                        ? true
                        : false,
                    child: Image.file(
                      File(aadharPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: aadharPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              panPath != "" && panPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color: panPath != "" && panPath != "error"
                                  ? Colors.green
                                  : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              panPath = value!.files.first.path!;
                              print("panPath : $panPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              panPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Pan",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: panPath != "" && panPath != "error"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
                        )),
                  ),
                  Visibility(
                    visible: panPath != "" && panPath != "error" ? true : false,
                    child: Image.file(
                      File(panPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: panPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              jatiPath != "" && jatiPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color: jatiPath != "" && jatiPath != "error"
                                  ? Colors.green
                                  : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              jatiPath = value!.files.first.path!;
                              print("jatiPath : $jatiPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              jatiPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Jati(Caste-Certificate)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: jatiPath != "" && jatiPath != "error"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12),
                        )),
                  ),
                  Visibility(
                    visible:
                        jatiPath != "" && jatiPath != "error" ? true : false,
                    child: Image.file(
                      File(jatiPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: jatiPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              aawasiyaPath != "" && aawasiyaPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color:
                                  aawasiyaPath != "" && aawasiyaPath != "error"
                                      ? Colors.green
                                      : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              aawasiyaPath = value!.files.first.path!;
                              print("aawasiyaPath : $aawasiyaPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              aawasiyaPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Aawasiya",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color:
                                  aawasiyaPath != "" && aawasiyaPath != "error"
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 14),
                        )),
                  ),
                  Visibility(
                    visible: aawasiyaPath != "" && aawasiyaPath != "error"
                        ? true
                        : false,
                    child: Image.file(
                      File(aawasiyaPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: aawasiyaPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              aayPath != "" && aayPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color: aayPath != "" && aayPath != "error"
                                  ? Colors.green
                                  : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              aayPath = value!.files.first.path!;
                              print("aayPath : $aayPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              aayPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Aay(Income)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: aayPath != "" && aayPath != "error"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12),
                        )),
                  ),
                  Visibility(
                    visible: aayPath != "" && aayPath != "error" ? true : false,
                    child: Image.file(
                      File(aayPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: aayPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              photoPath != "" && photoPath != "error"
                                  ? Colors.green
                                  : Colors.white),
                          side: MaterialStateProperty.all(BorderSide(
                              color: photoPath != "" && photoPath != "error"
                                  ? Colors.green
                                  : Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          FilePicker.platform
                              .pickFiles(type: FileType.any)
                              .then((value) {
                            setState(() {
                              photoPath = value!.files.first.path!;
                              print("photoPath : $photoPath");
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              photoPath == "error";
                            });
                          });
                        },
                        child: Text(
                          "Upload Applicants Photo",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: photoPath != "" && photoPath != "error"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
                        )),
                  ),
                  Visibility(
                    visible:
                        photoPath != "" && photoPath != "error" ? true : false,
                    child: Image.file(
                      File(photoPath),
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: photoPath.isEmpty ? true : false,
                    child: Image.asset(
                      "assets/images/check.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    onPressed: () {
                      validateFormDetails();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FormSuccessScreen()));
                    },
                    child: const Text(
                      "Submit Application",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 40,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.green)),
                        overlayColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 148, 211, 151)),
                      ),
                      onPressed: () async {
                        //sendDirectBypassedMessage();
                        sendFirenaseOtp(inputPhone.text);
                        // sendFirenaseOtp("9977665544");
                      },
                      child: const Text(
                        "Send Confirmation Message",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ))),
              const SizedBox(height: 10),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 40,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.green)),
                        overlayColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 148, 211, 151)),
                      ),
                      onPressed: () async {},
                      child: const Text(
                        "Send OTP Message",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ))),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    fillColor: const MaterialStatePropertyAll(Colors.green),
                    value: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    width: 220,
                    child: Text(
                      "By sending us message you agree and give AlyonaFinance team to contact you using details submitted by you.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 97, 94, 94), fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              logoWidget()
            ],
          ),
        ),
      ),
    ));
  }

  Future<String?> dobDialog() {
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
                    SfDateRangePicker(
                      onSelectionChanged:
                          (dateRangePickerSelectionChangedArgs) {
                        setState(() {
                          inputDob = dateRangePickerSelectionChangedArgs;
                          print(
                              "inputDob : ${dateRangePickerSelectionChangedArgs.value.toString()}");
                          print(
                              "startDate : ${dateRangePickerSelectionChangedArgs.value.startDate}");
                        });
                      },
                      selectionMode: DateRangePickerSelectionMode.range,
                      initialSelectedRange: PickerDateRange(
                          DateTime(1900, 1, 1), DateTime(2023, 1, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Confirm Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 76, 4, 135)))),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel",
                                style: TextStyle(fontWeight: FontWeight.w700)))
                      ],
                    )
                  ],
                ))));
  }
}
