// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
  }

  void sendMail() async {
    String username = 'bibhakumori@gmail.com';
    String password = 'bgaxnlkcwwylssxx';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Alyona MicroFinance')
      ..recipients.add('gunjansharma1112info@gmail.com')
      ..ccRecipients.addAll(['gunjansharma1112info@yahoo.com'])
      ..bccRecipients.add(const Address('gunjansharma1112info@gmail.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      SnackBar(
        content: Text(sendReport.toString()),
        duration: const Duration(seconds: 10),
      );
    } on MailerException catch (e) {
      print('Message not sent.${e.message}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void launchFilledGmail() async {
    final Email email = Email(
      body:
          'Just now new contact message recieved from our app. \n <b>Applicant Name</b> : Sudhir Kumar\n <b>Father Name</b> : Mahawat Das\nAddress : Belaganj, Gaya\nMessage : I wanted to know loan interest rates\nDate : ${DateTime.now().toString()}',
      subject: 'New Contact Query Recieved [0089476] (Alyona MicroFinance)',
      recipients: ['bibhakumori@gmail.com'],
      cc: ['cc@example.com'],
      bcc: ['bcc@example.com'],
      //attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: true,
    );

    try {
      await FlutterEmailSender.send(email);
      print("Email app launched successfully..");
    } on Exception catch (e) {
      print('Error Occured while Launching email app : ${e.toString()}');
    }
  }

  Future<void> launchGmailPlain() async {
    String email = Uri.encodeComponent("mail@fluttercampus.com");
    String subject = Uri.encodeComponent("Hello Flutter");
    String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
    print(subject); //output: Hello%20Flutter
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await launchUrl(mail, mode: LaunchMode.externalApplication)) {
      //email app opened
    } else {
      //email app is not opened
    }
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
                sendMessageButton(context),
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

  Widget sendMessageButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            // sendMail();
            launchGmailPlain();
            print("send message btn clicked : ");
          },
          child: const Text(
            "Send Message",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          )),
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
