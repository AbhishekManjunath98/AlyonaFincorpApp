// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Contact Us",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Fill the form below to send us a direct message. We will resolve your any query regarding loan process with utmost priority.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 97, 94, 94), fontSize: 14),
                  ),
                ),
                const SizedBox(height: 25),
                const TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(48.0))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(48.0))),
                    hintText: 'Your full name..',
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(48.0))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(48.0))),
                    hintText: 'Mobile No',
                  ),
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 65,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(48.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(48.0))),
                      hintText: 'Type your query in detail...',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  child: TextButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {},
                      child: const Text(
                        "Send Message",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      fillColor: const MaterialStatePropertyAll(Colors.green),
                      value: true,
                      onChanged: (value) {},
                    ),
                  const  SizedBox(
                      width: 220,
                      child: Text(
                        "By sending us message you agree and give AlyonaFinance team to contact you using details submitted by you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 97, 94, 94),
                            fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

AppBar appbarWidget() {
    return AppBar(
      title: const Text('Alyona MicroFinance'),
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

}
