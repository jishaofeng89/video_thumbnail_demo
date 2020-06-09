import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickVideo extends StatefulWidget {
  PickVideo({Key key}) : super(key: key);

  @override
  _PickVideoState createState() => _PickVideoState();
}

class _PickVideoState extends State<PickVideo> {
  TextEditingController _controller = TextEditingController();

  upload() async {
    File file = await ImagePicker.pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
    print(file);
    PickedFile pickedFile = await ImagePicker().getVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
    print(pickedFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上传作品'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: '给你的作品一个标题吧',
              ),
            ),
            GestureDetector(
              child: Container(
                height: 150,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('images/cloud_upload.png'),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Text('上传作品'),
              ),
              onTap: () {
                upload();
              },
            ),
          ],
        ),
      ),
    );
  }
}
