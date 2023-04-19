import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/interface/tabbar_listener.dart';
import 'package:bottle_app/view/layout/layout_admin_notifications_history.dart';
import 'package:bottle_app/view/layout/layout_admin_notifications_new_notification.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../interface/loading_listener.dart';

class ScreenAdminNotifications extends StatefulWidget {
  @override
  State<ScreenAdminNotifications> createState() =>
      _ScreenAdminNotificationsState();
}

class _ScreenAdminNotificationsState extends State<ScreenAdminNotifications> with SingleTickerProviderStateMixin implements LoadingListener,TabBarListener  {
  late TabController controller ;
  int currentindex=1;
  bool loadingstatus=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
    TabController(length: 2, vsync: this, initialIndex: currentindex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentindex,
      length: 2,
      child: CustomProgressWidget(
        loading: loadingstatus,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: Center(
                  child: Text(
                    LocaleKeys.sendnotifications.tr,
                style: TextStyle(color: Colors.black),
              )),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      border: Border.all(width: 1.sp, color: Colors.black)),
                  child: TabBar(
                    controller: controller,
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24.sp),
                    ),
                    tabs: [
                      Tab(
                        text: LocaleKeys.history.tr,
                      ),
                      Tab(
                        text: LocaleKeys.newww.tr,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                      controller: controller,
                  children: [
                    LayoutAdminNotificationsHistory(),
                    LayoutAdminNotificationsNewNotifications(listener: this,tabBarListener: this,)
                  ],
                ))
              ],
            )),
      ),
    );
  }

  @override
  void onLoadingStatusChanged(bool status) {
    // Get.snackbar("Alert", "Status: $status");
    loadingstatus=status;
    setState(() {});
  }

  @override
  void onTabBarChanged(int tabValue) {
    // TODO: implement onTabBarChanged
    controller.animateTo(tabValue);
    print(currentindex);
  }

}