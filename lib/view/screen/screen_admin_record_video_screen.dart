
import 'dart:async';

import 'package:bottle_app/view/screen/screen_admin_new_story_description.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class ScreenAdminRecordVideoScreen extends StatefulWidget {
  const ScreenAdminRecordVideoScreen({Key? key}) : super(key: key);

  @override
  _ScreenAdminRecordVideoScreenState createState() =>
      _ScreenAdminRecordVideoScreenState();
}

class _ScreenAdminRecordVideoScreenState
    extends State<ScreenAdminRecordVideoScreen> {
  late CameraController controller;
  bool _isRecording=false;
  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 10) {
          setState(() {
            timer.cancel();
            _recordVideo();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }



  _recordVideo() async {
    if (_isRecording) {
      final xfile = await controller.stopVideoRecording();
      print('File path is this/File path is this/File path is this/File path is this/File path is this/');
      print(xfile.path);
      print(xfile.runtimeType);
      setState(() => _isRecording = false);
      Get.to(()=>ScreenAdminNewStoryDescription(rcievingFile: xfile.path,));
    } else {
      await controller.prepareForVideoRecording();
      await controller.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
              children: [
                Container(
                    height: Get.height,
                    width: Get.width,
                    child: CameraPreview(controller)),
                Positioned(bottom: 0,
                  child: Container(width: Get.width,margin: EdgeInsets.symmetric(vertical: 8.sp),child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.flip_camera_ios_outlined,color: Colors.white,)),
                        GestureDetector(onTap: () async{
                          await _recordVideo();
                          startTimer();
                        },child: Image(height: Get.height/12,width: Get.width/5,image: AssetImage('assets/images/record_video_icon.png'))),
                        IconButton(onPressed: (){}, icon: Icon(Icons.browse_gallery,color: Colors.white,))
                      ],
                    ),),
                ),
                Positioned(top: 0,
                  child: Container(width: Get.width,margin: EdgeInsets.symmetric(vertical: 8.sp),child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,)),
                        Text(_start.toString(),style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w400,color: Colors.white),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.white,))
                      ],
                    ),),
                ),
              ], ),
        ),
      ),
    );
  }
}
