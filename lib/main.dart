import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compass_demo/video_thumbnail.dart';
import 'package:video_compress/video_compress.dart';
import 'package:file_selector/file_selector.dart';
import 'dart:io';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '视频压缩demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: VideoThumbnail(),
      builder: EasyLoading.init(),
    );
  }
}
