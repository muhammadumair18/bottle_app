import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ItemAdminStateStoriesLayout extends StatefulWidget {

  String story_thumbnail,story_title,story_publishTime;


  @override
  _ItemAdminStateStoriesLayoutState createState() => _ItemAdminStateStoriesLayoutState();

  ItemAdminStateStoriesLayout({
    required this.story_thumbnail,
    required this.story_title,
    required this.story_publishTime,
  });
}

class _ItemAdminStateStoriesLayoutState extends State<ItemAdminStateStoriesLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.story_thumbnail),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7.sp)),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              color: Color.fromRGBO(255, 255, 255, 0.44),
              padding: EdgeInsets.symmetric(
                  vertical: 4.sp, horizontal: 4.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.story_title,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.story_publishTime,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 4.sp, horizontal: 4.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Confirm Delete',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Do you want to delete this story?',
                                    style: normal_h2Style.copyWith(
                                        color: Colors.red),
                                  ),
                                  SizedBox(height: 4.sp,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Yes')),
                                      OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('NO')),
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 4.sp),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.44),
                            borderRadius: BorderRadius.circular(25.sp)),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        )),
                  ),
                  SizedBox(
                    width: 4.sp,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 4.sp),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.44),
                            borderRadius: BorderRadius.circular(25.sp)),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
