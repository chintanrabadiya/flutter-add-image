import 'package:flutter/material.dart';
import 'image_bunner.dart';
import 'text_section.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              child: Text('chintan',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ImageBanner("assets/images/puppy.jpg"),
            TextSection(Colors.red),
            TextSection(Colors.green),
            TextSection(Colors.blue),
          ]),
    );
  }
}