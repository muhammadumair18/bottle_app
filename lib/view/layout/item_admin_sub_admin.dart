import 'package:bottle_app/model/sub_admins.dart';
import 'package:bottle_app/view/screen/screen_admin_sub_admin_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemAdminSubAdmin extends StatelessWidget {

  SubAdmins sybadmingetting;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ScreenAdminSubAdminDetails(subadmindetail: sybadmingetting,));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 5.sp),
            child: ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sybadmingetting.fullName,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Colors.black),
                  ),
                  Text(
                    sybadmingetting.emal,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(.45)),
                  )
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
              ),
            ),
          ),
          Container(height: 1.sp,color: Colors.black.withOpacity(.1),)
        ],
      ),
    );
  }

  ItemAdminSubAdmin({
    required this.sybadmingetting
  });
}
