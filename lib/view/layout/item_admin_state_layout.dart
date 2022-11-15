import 'package:bottle_app/view/screen/screen_admin_state_stories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemAdminStateLayout extends StatelessWidget {

  String stateImg,stateName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Get.to(()=>ScreenAdminStateStories());
    },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.sp),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 5,
                offset: Offset(5,5)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 1.sp),
                child: Image.asset(
                  this.stateImg,
                )),
            SizedBox(height: 3.sp,),
            Text(
              this.stateName,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  ItemAdminStateLayout({
    required this.stateImg,
    required this.stateName,
  });
}
