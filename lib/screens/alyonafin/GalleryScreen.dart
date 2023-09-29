import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> images = [
    "adv1.jpeg",
    "adv2.jpeg",
    "adv3.jpeg",
    "adv4.jpeg",
    "adv5.jpeg",
    "adv6.jpeg",
    "adv7.jpeg",
    "adv8.jpeg",
    "adv1.jpeg",
    "adv2.jpeg",
    "adv1.jpeg",
    "adv2.jpeg",
    "adv3.jpeg",
    "adv4.jpeg",
    "adv5.jpeg",
    "adv6.jpeg",
    "adv7.jpeg",
    "adv8.jpeg",
    "adv1.jpeg",
    "adv2.jpeg",
    "adv1.jpeg",
    "adv2.jpeg",
    "adv3.jpeg",
    "adv4.jpeg",
    "adv5.jpeg",
    "adv6.jpeg",
    "adv7.jpeg",
    "adv8.jpeg",
    "adv1.jpeg",
    "adv2.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: listViewWidget(),
      ),
    );
  }

  Future<String?> successDialog(String image) {
    return showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Container(
              child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 2.0,
                  child: Image.asset("assets/images/$image")),
            )));
  }

  Container listViewWidget() {
    return Container(
        child: ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: listImage(images[index]),
          onTap: () {
            successDialog(images[index]);
          },
        );
      },
    ));
  }

  Widget listImage(String image) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 6),
      child: Image.asset("assets/images/$image"),
    );
  }
}
