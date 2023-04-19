import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/view/layout/item_admin_state_stories_layout.dart';
import 'package:bottle_app/view/screen/screen_admin_record_video_screen.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenAdminStateStories extends StatefulWidget {
  const ScreenAdminStateStories({Key? key}) : super(key: key);

  @override
  _ScreenAdminStateStoriesState createState() =>
      _ScreenAdminStateStoriesState();
}

class _ScreenAdminStateStoriesState extends State<ScreenAdminStateStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Hawaii',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 5.sp),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.sp,
              crossAxisSpacing: 5.sp,
              childAspectRatio: (2 / 3)),
          children: [
            GestureDetector(
              onTap: (){
                Get.to(ScreenAdminRecordVideoScreen());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.sp),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(7.sp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          border: Border.all(width: 2.sp, color: Colors.white)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      LocaleKeys.addnewstory.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < 4; i++)
              ItemAdminStateStoriesLayout(
                  story_thumbnail: 'assets/images/wiskey.png',
                  story_title: 'Drink Bar Club',
                  story_publishTime: DateTime.now().year.toString())
          ],
        ),
      ),
    );
  }
}
