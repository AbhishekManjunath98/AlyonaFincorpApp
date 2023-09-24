import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:whatsappuiclone/screens/alyonafin/FormSuccessScreen.dart';

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

class _FillFormScreenState extends State<FillFormScreen> {
  final onSelectionChanged = "";
  Future<FilePickerResult>? filePickerAadharResult;

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
              const TextField(
                decoration: InputDecoration(
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
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
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
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
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
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
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
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
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
                style: TextStyle(
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
                    child: const Text(
                      "Select Date of Birth",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 14),
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Aadhar",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Pan",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Jati(Caste-Certificate)",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Aawasiya",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Aay(Income)",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 148, 211, 151)),
                        ),
                        onPressed: () async {
                          filePickerAadharResult =
                              FilePicker.platform.pickFiles(type: FileType.any)
                                  as Future<FilePickerResult>?;
                        },
                        child: const Text(
                          "Upload Applicants Photo",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ),
                  Image.asset(
                    "assets/images/check.png",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormSuccessScreen()));
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
                          (dateRangePickerSelectionChangedArgs) {},
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
