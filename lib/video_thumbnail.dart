import 'dart:io';
import 'dart:math';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class VideoThumbnail extends StatefulWidget {
  @override
  _VideoThumbnailState createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  File? _thumbnailFile;

  String? originalFilePath;


  double value1 = 0;
  double value2 = 0;
  double value3 = 0;
  double value4 = 0;
  double value5 = 0;
  double value6 = 0;
  double value7 = 0;
  double value8 = 0;




  @override
  Widget build(BuildContext context) {
    Future<void> _getVideoThumbnail() async {
      File? file;

      if (Platform.isMacOS) {
        // const typeGroup =
        //     XTypeGroup(label: 'videos', extensions: ['mov', 'mp4']);
        // file = await openFile(acceptedTypeGroups: [typeGroup]);
      } else {
        final picker = ImagePicker();
        var pickedFile = await picker.pickVideo(source: ImageSource.gallery);
        if (pickedFile != null) {
          file = File(pickedFile.path);
        }
      }

      if (file != null) {
        final info1 = await VideoCompress.getMediaInfo(file.path);
        originalFilePath = file.path;

        _thumbnailFile = await VideoCompress.getFileThumbnail(file.path);

        setState(() {
          print(_thumbnailFile);
          print('压缩前大小:${info1.filesize}');
        });
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('视频压缩demo'),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ElevatedButton(onPressed: ()async{
            //   final AssetEntity? entity = await CameraPicker.pickFromCamera(context,
            //     pickerConfig: const CameraPickerConfig(
            //       enableAudio: true,
            //       onlyEnableRecording: true,
            //       enableTapRecording: true,
            //       enableRecording: true,
            //       shouldAutoPreviewVideo: true,
            //       shouldDeletePreviewFile: true
            //     )
            //
            //   );
            //   // if(entity!=null){
            //   //   var file = await entity.file;
            //   //   originalFilePath = file?.path;
            //   //   if(file!=null){
            //   //     await compressAndSaveToGalleryByFile(file);
            //   //   }
            //   // }
            //
            //
            // }, child: const Text("拍摄视频")),
            //
            // ElevatedButton(
            //     onPressed: ()async{
            //       final List<AssetEntity>? result = await AssetPicker.pickAssets(
            //         context,
            //         pickerConfig: const AssetPickerConfig(
            //          requestType: RequestType.video
            //         )
            //       );
            //     }, child: const Text('获取视频')),

            ElevatedButton(
                onPressed: _getVideoThumbnail, child: const Text('获取视频')),
            _buildThumbnail(),
            Wrap(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.Res1920x1080Quality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value1 =(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('压缩1080 ${renderSize(value1)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.Res1280x720Quality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value2 =(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('压缩720 ${renderSize(value2)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.Res960x540Quality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value3 =(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('压缩540 ${renderSize(value3)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.Res640x480Quality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value4 =(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('压缩480 ${renderSize(value4)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.LowQuality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value5 =(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('低画质压缩 ${renderSize(value5)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.HighestQuality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value6=(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('高画质压缩 ${renderSize(value6)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.DefaultQuality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                          await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value7=(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('默认画质压缩 ${renderSize(value7)}')),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: "开始压缩");
                      if (originalFilePath != null) {
                        final inf = await VideoCompress.compressVideo(
                          originalFilePath!,
                          quality: VideoQuality.MediumQuality, // 设置压缩质量
                          deleteOrigin: false, // 是否删除原始视频
                          includeAudio: true, // 是否保留音频
                        );
                        if(inf!=null){
                           await compressAndSaveToGallery(inf);
                        }
                        EasyLoading.dismiss();
                        setState(() {
                          value8=(inf?.filesize??0.0).toDouble();
                        });
                      }
                    },
                    child:  Text('中等画质压缩  ${renderSize(value8)}')),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///@title compressAndSaveToGallery
  ///@description TODO 根据路径将视频保存到手机相册
  ///@param: input
  ///@return: Future<void>
  ///@updateTime 2023/6/18 13:54
  ///@author LinGuanYu
  Future<void> compressAndSaveToGallery(MediaInfo input) async {


      final appDir = await getTemporaryDirectory();
      Random random = Random();
      // 生成一个随机整数
      int randomNumber = random.nextInt(100);
      final compressedPath = '${appDir.path}/compressed$randomNumber.mp4';
      final compressedFile = File(compressedPath);
      if(input.file!=null){
        final saved = await compressedFile.writeAsBytes(await input.file!.readAsBytes());
        if (saved != null) {
          await GallerySaver.saveVideo(saved.path);
          EasyLoading.showSuccess("视频保存相册成功");
        } else {
          EasyLoading.showError("视频保存失败");

        }
      }else{
        EasyLoading.showError("无效文件");
      }
  }


  Future<void> compressAndSaveToGalleryByFile(File file) async {
    final appDir = await getTemporaryDirectory();
    Random random = Random();
    // 生成一个随机整数
    int randomNumber = random.nextInt(100);
    final compressedPath = '${appDir.path}/compressed$randomNumber.mp4';
    final compressedFile = File(compressedPath);
    if(file!=null){
      final saved = await compressedFile.writeAsBytes(await file!.readAsBytes());
      if (saved != null) {
        await GallerySaver.saveVideo(saved.path);
        EasyLoading.showSuccess("视频保存相册成功");
      } else {
        EasyLoading.showError("视频保存失败");

      }
    }else{
      EasyLoading.showError("无效文件");
    }
  }




  ///格式化文件大小
  renderSize(double value) {
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }


  Widget _buildThumbnail() {
    if (_thumbnailFile != null) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: Image(image: FileImage(_thumbnailFile!)),
      );
    }
    return Container();
  }
}
