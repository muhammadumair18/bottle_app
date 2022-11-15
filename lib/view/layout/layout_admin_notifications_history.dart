import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/model/notifications.dart';
import 'package:bottle_app/view/layout/item_admin_notifications_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LayoutAdminNotificationsHistory extends StatelessWidget {
  const LayoutAdminNotificationsHistory({Key? key}) : super(key: key);


  // TextEditingController e = TextEditingController(), f = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: notificationref.snapshots(),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        if(snapshot.hasData){
          var data=snapshot.data!.docs.map((e) =>notification.fromMap((e.data() as Map<String,dynamic>))).toList();
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var innerdata=data[index];
                DateTime timee=DateTime.fromMillisecondsSinceEpoch(innerdata.uploadTime);
                return ItemAdminNotificationHistory(
                    description:innerdata.descritionn,
                    title: innerdata.title,
                    time: "${timee.day}/${timee.month}/${timee.year}",
                    imgLink:innerdata.imageUrl
                );
              });
        }
        return Center(child: Text('Error in loading data',style: TextStyle(color: Colors.red,fontSize: 12),),);
      },
    );
  }
}
