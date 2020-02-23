import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
//import 'app.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "camera app",
    home: LandingScreen(),
    ),
  );
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: () {
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text('Camera'),
                onTap: () {
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _imageView (){
    if (imageFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imageFile,width: 400,height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _imageView(),
              RaisedButton(onPressed: () {
                _showChoiceDialog(context);
               },
                child: Text('select image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





//
//class f2 extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp (
//      debugShowCheckedModeBanner: false,
//      home: App(),
//    );
//  }
//}

