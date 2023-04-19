import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/view/layout/item_admin_sub_admin.dart';
import 'package:bottle_app/view/screen/screen_admin_add_new_sub_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../model/sub_admins.dart';

class ScreenAdminSubAdmins extends StatefulWidget {
  const ScreenAdminSubAdmins({Key? key}) : super(key: key);

  @override
  State<ScreenAdminSubAdmins> createState() => _ScreenAdminSubAdminsState();
}

class _ScreenAdminSubAdminsState extends State<ScreenAdminSubAdmins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.black,onPressed: (){
      Get.to(ScreenAdminAddNewSubAdmin());
    },),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Center(child: Text(LocaleKeys.subadmins.tr,style: TextStyle(color: Colors.black),)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data =snapshot.data!.docs.map((e) => SubAdmins.fromMap(e.data() as Map<String,dynamic>)).toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var innerData=data[index];
              return ItemAdminSubAdmin(sybadmingetting: innerData,);
            },);
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }
          return Center(child: Text(LocaleKeys.nodataavailable.tr,style: TextStyle(color: Colors.red,fontSize: 12),));
        },),
    );
  }
}
