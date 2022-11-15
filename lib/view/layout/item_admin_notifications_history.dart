import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ItemAdminNotificationHistory extends StatelessWidget {

  String description,title,time,imgLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 6.sp, horizontal: 8.sp),
      padding: EdgeInsets.symmetric(
          vertical: 5.sp, horizontal: 5.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(
              width: 1.sp, color: Color(0xffcecaca))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Title: ',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),),
                  Text(title,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),),
                ],
              ),
              Text(time
                  .toString(),style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w300),)
            ],
          ),
          SizedBox(
            height: 8.sp,
          ),
          Text(
            'Description:',
            style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),
          ),
          Text(
            description,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),),
          SizedBox(
            height: 3.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Attached File: ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),),
                SizedBox(
                  width: 5.sp,
                ),
                Container(
                  height: Get.height / 15,
                  width: Get.width / 10,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(4.sp),
                      border: Border.all(
                          width: 1.sp, color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(
                              imgLink),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ItemAdminNotificationHistory({
    required this.description,
    required this.title,
    required this.time,
    required this.imgLink,
  });
}
