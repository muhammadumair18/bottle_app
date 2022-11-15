import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/view/screen/screen_admin_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bottle_app/model/user.dart' as model;
import 'package:intl/intl.dart';

class ScreenAdminUserDetail extends StatefulWidget {
  String UserIdToGetDetails;

  @override
  _ScreenAdminUserDetailState createState() => _ScreenAdminUserDetailState();

  ScreenAdminUserDetail({
    required this.UserIdToGetDetails,
  });
}

class _ScreenAdminUserDetailState extends State<ScreenAdminUserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'User Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          getUserData(widget.UserIdToGetDetails),
          getVideoData(widget.UserIdToGetDetails)
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            model.User innerUser = snapshot.data[0];
            int postsLength = snapshot.data[1];
            DateTime bithDate =
                DateTime.fromMillisecondsSinceEpoch(innerUser.DateofBirth);
            final DateFormat format1 = DateFormat('MMM');
            return Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: Get.height * .25,
                    width: Get.width * .25,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.sp, color: Colors.red),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                                'assets/images/image ${innerUser.profilePicNo}.png'))),
                  ),
                ),
                Container(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Followers',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '296',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.sp),
                          child: VerticalDivider(
                            thickness: 1.sp,
                            color: Color(0xffa7a4a4),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Following',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '296',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.sp),
                          child: VerticalDivider(
                            thickness: 1.sp,
                            color: Color(0xffa7a4a4),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ScreenAdminPosts(
                              postsOfUser: innerUser.id,
                            ));
                          },
                          child: Column(
                            children: [
                              Text(
                                'Total Posts',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                postsLength.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Text(
                        innerUser.Name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: .2.sp,
                  color: Colors.grey,
                  height: 30.sp,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Text(
                        '${innerUser.countrycode} ${innerUser.phoneNumber}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: .2.sp,
                  color: Colors.grey,
                  height: 30.sp,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Text(
                        "${bithDate.day} ${format1.format(bithDate)}, ${bithDate.year}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: .2.sp,
                  color: Colors.grey,
                  height: 30.sp,
                ),
                SizedBox(
                  height: 8.sp,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(width: 1.sp, color: Colors.red)),
                    padding: EdgeInsets.symmetric(
                        vertical: 7.sp, horizontal: Get.width * .18),
                    child: Text(
                      'Block User',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return Center(
            child: Text(
              'No Data Available',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
