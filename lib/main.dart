import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappuiclone/screens/HomeScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:whatsappuiclone/screens/alyonafin/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyState {
  PreferredSizeWidget appbar;
  Widget drawer;

  MyState(this.appbar, this.drawer);
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

final provider = Provider<MyState>(
  create: (context) => MyState(appbarWidget(), drawerWidget()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 4, 190, 11)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
