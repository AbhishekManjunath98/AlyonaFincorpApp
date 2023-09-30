// ignore_for_file: file_names

import 'dart:io';
import 'dart:math';

import 'package:com.amf.alyonamicrofinance/screens/alyonafin/ContactScreen.dart';
import 'package:com.amf.alyonamicrofinance/screens/alyonafin/FillFormScreen.dart';
import 'package:com.amf.alyonamicrofinance/screens/alyonafin/GalleryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:url_launcher/url_launcher.dart';


class MyCustomScaffold extends StatelessWidget {
  final Widget body;
  // final AppBar appBar;
  //final Widget drawer;

  const MyCustomScaffold({
    Key? key,
    required this.body,
    //this.appBar,
    //this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(),
      drawer: drawerWidget(),
      body: body,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawerWidget(),
        appBar: appbarWidget(),
        body: tabbarWidget(),
      ),
    );
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

  void flutterMailer() async {
    const GMAIL_SCHEMA = 'com.google.android.gm';

    final MailOptions mailOptions = MailOptions(
      subject:
          'New Contact Query Recieved [00${generateRandomNumber(6)}] (Alyona MicroFinance)',
      recipients: ['example@example.com'],
      isHTML: true,
      bccRecipients: ['other@example.com'],
      ccRecipients: ['third@example.com'],
      appSchema: GMAIL_SCHEMA,
    );
    try {
      Future<MailerResponse> mr = FlutterMailer.send(mailOptions);
      print("mr : ${mr.toString()}");
    } on Exception catch (e) {
      print("fluttermailer error : ${e.toString()}");
    }
  }

  Widget tabbarWidget() {
    return const TabBarView(
      children: <Widget>[
        Center(
          child: FillFormScreen(),
        ),
        Center(
          child: ContactScreen(),
        )
      ],
    );
  }

  AppBar appbarWidget() {
    return AppBar(
      title: const Text('Alyona MicroFinance'),
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.file_copy),
              SizedBox(
                width: 5,
              ),
              Text("Fill Application"),
            ]),
          ),
          Tab(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.phone),
              SizedBox(
                width: 5,
              ),
              Text("Contact Us"),
            ]),
          ),
        ],
      ),
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
            onTap: () {
              _scaffoldKey.currentState!.closeDrawer();
            },
          ),
          ListTile(
            title: const Text(
              "Fill New Form(Agents)",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.edit),
            onTap: () {
              _scaffoldKey.currentState!.closeDrawer();
            },
          ),
          ListTile(
            title: const Text(
              "Gallery",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.browse_gallery),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GalleryScreen()));
            },
          ),
          ListTile(
            title: const Text(
              "Contact Us",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.contact_page),
            onTap: () {
              flutterMailer();
            },
          ),
          ListTile(
            title: const Text(
              "About Us",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.person),
            onTap: () async {
              await launchUrl(Uri.parse("https://alyonafinance.in"));
            },
          ),
          ListTile(
            title: const Text(
              "Visit Website",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.web),
            onTap: () async {
              await launchUrl(Uri.parse("https://alyonafinance.in"));
            },
          ),
          ListTile(
            title: const Text(
              "Email Us",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.contact_mail),
            onTap: () {
              flutterMailer();
            },
          ),
          ListTile(
            title: const Text(
              "Rate Us On Playstore",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.rate_review),
            onTap: () async {
              await launchUrl(
                  Uri.parse('market://details?id=com.amf.alyonamicrofinance'),
                  mode: LaunchMode.externalNonBrowserApplication);
            },
          ),
          ListTile(
            title: const Text(
              "Terms & Conditions",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.warning),
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://alyonafinance.in/terms-and-conditions"));
            },
          ),
          ListTile(
            title: const Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.warning),
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://alyonafinance.in/privacy-policy"));
            },
          ),
          ListTile(
            title: const Text(
              "Exit App",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
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
            "assets/images/alyonaicon.jpeg",
            height: 90,
            width: 90,
          ),
        ),
        const Text(
          "Alyona MicroFinance",
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
