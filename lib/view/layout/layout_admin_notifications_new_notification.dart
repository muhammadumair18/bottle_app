import 'dart:io';

import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/interface/loading_listener.dart';
import 'package:bottle_app/interface/tabbar_listener.dart';
import 'package:bottle_app/model/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class LayoutAdminNotificationsNewNotifications extends StatefulWidget {
  LoadingListener listener;
  TabBarListener tabBarListener;

  @override
  State<LayoutAdminNotificationsNewNotifications> createState() =>
      _LayoutAdminNotificationsNewNotificationsState();

  LayoutAdminNotificationsNewNotifications({
    required this.listener,
    required this.tabBarListener,
  });
}

class _LayoutAdminNotificationsNewNotificationsState
    extends State<LayoutAdminNotificationsNewNotifications> {
  TextEditingController titleController = TextEditingController(),
      descriptionController = TextEditingController();
  XFile? imagefile;
  ImagePicker _picker = ImagePicker();
  String title = '';
  String description = '';
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isloadingvalue = false;

  bool newStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _key,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp)),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return LocaleKeys.lessthan5.tr;
                        }
                        if(value.length>12){
                          return LocaleKeys.notgreaterthan12.tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        title = value;
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.title.tr,
                        fillColor: Color(0xFFF6F6F6),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp)),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length < 4) {
                          return LocaleKeys.lessthan4.tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        description = value;
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.description.tr,
                        fillColor: Color(0xFFF6F6F6),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      maxLines: 4,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              imagefile == null
                  ? GestureDetector(
                      onTap: () async {
                        final ImagePicker _picker = ImagePicker();
                        final imageefile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          imagefile = imageefile;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 35.sp,
                            right: 25.sp,
                            top: 15.sp,
                            bottom: 15.sp),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5.sp, color: Colors.black),
                            borderRadius: BorderRadius.circular(12.sp)),
                        child: Column(
                          children: [
                            Container(
                                height: Get.height / 8,
                                width: Get.width / 5,
                                child: Image(
                                    image: AssetImage(
                                  'assets/images/upload_picture_logo.png',
                                ))),
                            Text(
                              LocaleKeys.uploadfile.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height * .4,
                      width: Get.width / .4,
                      child: Image.file(File(imagefile!.path)),
                    ),
              SizedBox(
                height: 10.sp,
              ),
              GestureDetector(
                onTap: () async {
                  // widget.listener.onLoadingStatusChanged(!newStatus);
                  print("The path of image file  ${imagefile?.path}");
                  print(await _localPath);
                  await getData();
                  // String inresponce = await uploadNotification();
                  // if (inresponce == 'success') {
                  //   widget.tabBarListener.onTabBarChanged(0);
                  //   Get.snackbar('Success', 'The Notification has been added',backgroundColor: Colors.green,colorText: Colors.black);
                  // }
                  // else{
                  //   Get.snackbar('Error', inresponce,backgroundColor: Colors.red,colorText: Colors.black);
                  // }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 55.sp),
                  child: Text(
                    LocaleKeys.send.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void getImage() async {
  //   XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     oldPickedImage = pickedImage;
  //   });
  // }


  Future<void> getData() async{
    Directory directory=await getApplicationDocumentsDirectory();
    print("The path of directory   ${directory.path}");
  }

  Future<String> get _localPath async {
    final Directory extDir = await getTemporaryDirectory();
    return extDir.path;
  }

  Future<String> uploadNotification() async {
    String responce = '';
    if(!(_key.currentState!.validate())){
      return LocaleKeys.textfieldshouldbeok.tr;
    }
    String title = titleController.text;
    String description = descriptionController.text;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    await uploadimage(uid, currentTime).then((value) async {
      notification ntof = notification(
          title: title,
          descritionn: description,
          imageUrl: value,
          uploadAdminId: uid,
          docName: '${uid}on${currentTime}',
          uploadTime: currentTime);
      await notificationref.doc().set(ntof.toMap()).then((value) {
        responce = 'success';
      }).onError((error, stackTrace) {
        responce = error.toString();
      });
    }).onError((error, stackTrace) {
      responce = error.toString();
    });
    return responce;
  }

  Future<String> uploadimage(String adminuid, int timee) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('notificaitons')
        .child('${adminuid}on${timee}');
    UploadTask uploadTask = ref.putFile(File(imagefile!.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadurl = await taskSnapshot.ref.getDownloadURL();
    return downloadurl;
  }
}
