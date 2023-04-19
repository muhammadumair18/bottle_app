import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/view/layout/item_admin_state_layout.dart';
import 'package:bottle_app/view/screen/screen_admin_new_story_description.dart';
import 'package:bottle_app/view/screen/screen_admin_record_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenAdminMyStoriesStates extends StatefulWidget {
  const ScreenAdminMyStoriesStates({Key? key}) : super(key: key);

  @override
  _ScreenAdminMyStoriesStatesState createState() => _ScreenAdminMyStoriesStatesState();
}

class _ScreenAdminMyStoriesStatesState extends State<ScreenAdminMyStoriesStates> {
  List<List<String>> stateImageList = [
    ['assets/images/washington.png', 'Washington'],
    ['assets/images/alaska.png', 'Alaska'],
    ['assets/images/california.png', 'California'],
    ['assets/images/florida.png', 'Florida'],
    ['assets/images/georgia.png', 'Georgia'],
    ['assets/images/hawaii.png', 'Hawaii'],
    ['assets/images/texas.png', 'Texas'],
    ['assets/images/virgina.png', 'Virgina']
  ];

  List<String> statelist = [
    'Layyah',
    'Lahore',
    'Islamabad',
    'Chubara',
    'Karachi'
  ];

  String? _selectedDropdwonValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 48.sp,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          LocaleKeys.mystories.tr,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                          title: Center(
                              child: Text(
                                LocaleKeys.addnewstate.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp),
                          )),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: Color(0xffF6F6F6),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: DropdownButton(
                                  isExpanded: true,
                                  iconSize: 32.sp,
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  underline: SizedBox(),
                                  items: statelist.map((e) {
                                    return DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedDropdwonValue =
                                          newValue.toString();
                                    });
                                  },
                                  hint: Text(
                                    LocaleKeys.selectstate.tr,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17.sp),
                                  ),
                                  value: _selectedDropdwonValue,
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Colors.black),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.sp, horizontal: 55.sp),
                                  child: Text(
                                    LocaleKeys.add.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  });
            },
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 14.sp,
                    )),
                Text(
                  LocaleKeys.state.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                )
              ],
            ),
          ),
          SizedBox(
            width: 6.sp,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5.sp, mainAxisSpacing: 5.sp),
          children: [
            GestureDetector(
              onTap: (){
                ScreenAdminRecordVideoScreen();
              },
              child: Container(
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
                      height: 3.sp,
                    ),
                    Text(
                      LocaleKeys.addstory.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      LocaleKeys.forall.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < stateImageList.length; i++)
              ItemAdminStateLayout(
                  stateImg: stateImageList[i][0],
                  stateName: stateImageList[i][1])
            // ...stateImageList.map((i) => ItemAdminMyStoriesLayout(
            //       stateImg: stateImageList[i][0],
            //       stateName: stateImageList[i][1],
            //     ))
            // ItemAdminMyStoriesLayout(stateImg: stateImageList[0][0], stateName: stateImageList[0][1])
          ],
        ),
      ),
    );
  }
}
