import 'dart:io';

import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/model/admin_posts.dart';
import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';


class ScreenAdminNewStoryDescription extends StatefulWidget {

  String rcievingFile;

  @override
  _ScreenAdminNewStoryDescriptionState createState() =>
      _ScreenAdminNewStoryDescriptionState();

  ScreenAdminNewStoryDescription({
    required this.rcievingFile,
  });
}

class _ScreenAdminNewStoryDescriptionState
    extends State<ScreenAdminNewStoryDescription> {
  late VideoPlayerController controller;
  String description='';
  File? filetopass;
  bool isLoading=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filetopass=File(widget.rcievingFile);
    File fv=File(widget.rcievingFile);
    controller=VideoPlayerController.file(fv)
    ..initialize().then((value) {
      setState(() {});
      controller.play();
      controller.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressWidget(
      loading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            LocaleKeys.newstory.tr,
            style: TextStyle(color: Colors.black,),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * .5,
                child: controller.value.isInitialized?
                AspectRatio(aspectRatio: controller.value.aspectRatio,child: VideoPlayer(controller),):
                Center(child: CircularProgressIndicator(color: Colors.red,),),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.sp),
                  child: CustomInputField(
                    onChange: (value){
                      description=value.toString();
                    },
                    isPasswordField: false,
                    hint: LocaleKeys.mentionhere.tr,
                    maxLines: 4,
                    limit: 25,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {isLoading=true;});
                  if(description==''){
                    Get.snackbar(LocaleKeys.missing.tr, LocaleKeys.descriptionmustbeprovided.tr,backgroundColor: Colors.red,colorText: Colors.black);
                    setState(() {isLoading=false;});
                  }
                  else{
                    _uploadVideoToStorage().then((value) {
                      Get.offAll(ScreenAdminDashbord());
                    }).catchError((onError){
                      setState(() {isLoading=false;});
                      Get.snackbar(LocaleKeys.error.tr, onError.toString(),backgroundColor: Colors.red,colorText: Colors.black);
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 65.sp),
                  child: Text(
                    LocaleKeys.publish.tr,
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

  Future<String> _uploadVideoToStorage() async{
    String responce='';
    int timeOfUploading=DateTime.now().millisecondsSinceEpoch;
    String videoUrl= await uploadvideo(timeOfUploading);
    String thumbnail= await uploadThumbnail(timeOfUploading);
    AdminPosts pots=AdminPosts(
        uploadTime: timeOfUploading,
        description: description,
        adminID: FirebaseAuth.instance.currentUser!.uid,
        state: "",
        city: "",
        documentName: timeOfUploading.toString(),
        thumbnail: thumbnail, videoUrl: videoUrl);
    await adminpostsref.doc(timeOfUploading.toString()).set(pots.toMap()).then((value) {
      responce='success';
    }).catchError((onError){
      responce=onError.toString();
    });
    return responce;
  }

  Future<String> uploadvideo(int time) async{
    Reference reference=FirebaseStorage.instance.ref().child("AdminVideos").child(time.toString());
    UploadTask uploadTask=reference.putFile(await videoCompress());
    TaskSnapshot snap=await uploadTask;
    String downloadUrl=await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<File> videoCompress() async{
    MediaInfo? info=await VideoCompress.compressVideo(widget.rcievingFile);
    File fvvv=File(info!.path.toString());
    return fvvv;
  }

  Future<String> uploadThumbnail(int time) async{
    Reference reference=FirebaseStorage.instance.ref().child("AdminVideos").child(time.toString());
    UploadTask uploadTask=reference.putFile(await getThumbnail());
    TaskSnapshot snap=await uploadTask;
    String downloadUrl=await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  getThumbnail() async{
    final image=await VideoCompress.getFileThumbnail(widget.rcievingFile);
    return image;
  }


}
