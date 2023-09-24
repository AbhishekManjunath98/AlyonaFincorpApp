// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatsappuiclone/screens/alyonafin/ContactScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/EnterCodeScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/FillFormScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/FormFailureScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/FormSuccessScreen.dart';
import 'package:whatsappuiclone/screens/alyonafin/SplashScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: drawerWidget(),
        appBar: appbarWidget(),
        body: tabbarWidget(),
      ),
    );
  }

  Widget tabbarWidget() {
    return const TabBarView(
      children: <Widget>[
        Center(
          child: EnterCodeScreen(),
        ),
        Center(
          child: FillFormScreen(),
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
              Icon(Icons.copy),
              SizedBox(
                width: 5,
              ),
              Text("Clips"),
            ]),
          ),
          Tab(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.data_array),
              SizedBox(
                width: 5,
              ),
              Text("Analytics"),
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
