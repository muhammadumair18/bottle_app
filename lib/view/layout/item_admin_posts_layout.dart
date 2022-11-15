import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/view/layout/item_video_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bottle_app/model/user.dart';

class ItemAdminPostsLayout extends StatefulWidget {

  String personID,uploadTime,videoUrl;
  int likesLength;
  @override
  _ItemAdminPostsLayoutState createState() => _ItemAdminPostsLayoutState();

  ItemAdminPostsLayout({
    required this.personID,
    required this.uploadTime,
    required this.videoUrl,
    required this.likesLength,
  });
}

class _ItemAdminPostsLayoutState extends State<ItemAdminPostsLayout> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(widget.personID),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.hasData){
        User data=snapshot.data;
        return Column(
          children: [
            Container(height: 1.sp,color: Color(0xffBEBEBE),),
            Container(
              // height: Get.height * .2,
              padding: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                tileColor: Colors.white,
                leading: Container(
                  height: Get.height * .08.sp,
                  width: Get.width * .08.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/image ${data.profilePicNo}.png"))),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.Name,
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.uploadTime,
                      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400,color: Colors.black.withOpacity(.4)),
                    ),
                  ],
                ),
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.more_horiz_outlined),),
              ),
            ),
            Container(
              height: Get.height * .6,
              child: ItemVideoView(videoUrl: widget.videoUrl,),
            ),
            Container(
              color: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Likes',style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(width: 7,),
                  Text(widget.likesLength.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
              ],),
            ),
            SizedBox(height: 5,)
          ],
        );
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(color: Colors.green,),
        );
      }
      return SizedBox();
    },);
  }
}
