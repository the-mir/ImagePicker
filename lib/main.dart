import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImgPick(),
    );
  }
}

class ImgPick extends StatefulWidget {
  @override
  State<ImgPick> createState() => _ImgPickState();
}

class _ImgPickState extends State<ImgPick> {
  late File _image=File("");

  @override
//   void initState() {
//     super.initState();
//     _image = File(""); 
//   }

  Future<void> PickedImage (ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    setState(() {
      if (image != null) {
        _image = File(image.path); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blueGrey,
            child: _image == null ? Text("No image selected.") : Image.file(_image),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    PickedImage(ImageSource.camera);
                  },
                  child: Icon(Icons.camera),
                ),
                SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  onPressed: () {
                    PickedImage(ImageSource.gallery);
                  },
                  child: Icon(Icons.photo_library),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
