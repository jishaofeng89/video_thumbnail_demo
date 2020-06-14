import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PickVideo extends StatefulWidget {
  PickVideo({Key key}) : super(key: key);

  @override
  _PickVideoState createState() => _PickVideoState();
}

class _PickVideoState extends State<PickVideo> {
  TextEditingController _controller = TextEditingController();

  upload() async {
    PickedFile pickedFile = await ImagePicker().getVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
    print(pickedFile);

    final uint8list = await VideoThumbnail.thumbnailData(
      video: pickedFile.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );

    print(uint8list);
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
