import 'dart:convert';
import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/controllers/controller_registration.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/view/screen/screen_admin_blocked_users.dart';
import 'package:bottle_app/view/screen/screen_admin_mystories_states.dart';
import 'package:bottle_app/view/screen/screen_admin_notifications.dart';
import 'package:bottle_app/view/screen/screen_admin_settings.dart';
import 'package:bottle_app/view/screen/screen_admin_sub_admins.dart';
import 'package:bottle_app/view/screen/screen_admin_user.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class ScreenAdminDashbord extends StatelessWidget {
  RegistrationController _controller = Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.dashboard.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(5.sp)),
                          padding: EdgeInsets.symmetric(
                              vertical: 3.sp, horizontal: 3.sp),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 22.sp,
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20,
                left: 20,
                top: Get.height * 0.12,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminUser());
                        },
                        leading: Icon(
                          Icons.supervisor_account,
                          color: Colors.black,
                        ),
                        title: Text(
                          LocaleKeys.users.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminMyStoriesStates());
                        },
                        leading: Icon(
                          Icons.amp_stories,
                          color: Colors.black,
                        ),
                        title: Text(
                          LocaleKeys.stories.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminSubAdmins());
                        },
                        leading: Image.asset(
                          'assets/images/subadmin_icon.png', height: 25,
                          width: 25,),
                        title: Text(
                          LocaleKeys.subadmins.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminBlockedUsers());
                        },
                        leading: Icon(
                          Icons.block_flipped, color: Colors.black,),
                        title: Text(
                          LocaleKeys.blockeduser.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminNotifications());
                        },
                        leading: Icon(
                          Icons.notifications, color: Colors.black,),
                        title: Text(
                          LocaleKeys.notifications.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () {
                          Get.to(ScreenAdminSettings());
                        },
                        leading: Icon(Icons.settings, color: Colors.black,),
                        title: Text(
                          LocaleKeys.settings.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        onTap: () async {
                          // String responce=await sendPushMessage();
                          // print('responcee---------------');
                          // print('ressppoonncee is       ${responce}');
                          await callOnFcmApiSendPushNotifications(
                              title: 'Duniya', body: 'Khatam');
                          // callOnFcmApiSendPushNotifications(title: 'Duniya', body: 'abad');

                        },
                        leading: Icon(Icons.message, color: Colors.black,),
                        title: Text(
                          LocaleKeys.sendmessage.tr,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: appBoxShadow,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: ListTile(
                        leading: Icon(Icons.language, color: Colors.black,),
                        title: Text(
                          "Change Language",
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        trailing: Obx(() {
                          return Switch(
                            activeColor: Colors.grey,
                            activeTrackColor: Colors.orange.withOpacity(0.7),
                            value: _controller.isenglish.value,
                            onChanged: (bool value) {
                              _controller.isenglish.value = value;
                              english=_controller.isenglish.value;
                              Phoenix.rebirth(context);
                            },

                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> callOnFcmApiSendPushNotifications(
      {required String title, required String body}) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "notification": {"body": "${body}", "title": "${title}"},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done"
      },
      "to": "fyFtTPidQ9um6BJpiiVWfK:APA91bFu2spxSF8JSSEzGF4tIyVx2NltRikQIqErKGGF19BXzPxj4hz-JlenXW4XK9sktmaHbsrLeQMErJUggR1_CZMF0gXtVftBIDcm6xgoZ3AtGy5KFtkjs-nYki7gRbPmOX9nhb0V"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAUfx6dOY:APA91bFxxHCGO0VgcPk4G3WNz1K0QZkMhlufgOQTEzElGDp58CK8lcbDh9v7VodMc2XSbsYT0u10BIQfRx-jSmfhbX-wbe7P0gEZWpcUDaGx4Cq1bFQfymWFu6wY3ixmwZx_qSNYk_2K'
      // 'key=YOUR_SERVER_KEY'
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }

}
