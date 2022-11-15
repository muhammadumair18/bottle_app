import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/interface/setstate_listener.dart';
import 'package:bottle_app/view/layout/item_admin_users_block_and_unblock_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottle_app/model/user.dart' as model;
import 'package:sizer/sizer.dart';

class ScreenAdminBlockedUsers extends StatefulWidget {
  @override
  _ScreenAdminBlockedUsersState createState() =>
      _ScreenAdminBlockedUsersState();
}

class _ScreenAdminBlockedUsersState extends State<ScreenAdminBlockedUsers> implements SetstateListener{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Center(child: Text('Blocked Users',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),)),
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
      body: FutureBuilder<QuerySnapshot>(
        future: userref.where('isblocked',isEqualTo:true).get(),
        builder: ( context,snapshot) {
        if(snapshot.hasData){
          var data=snapshot.data!.docs.map((e) => model.User.fromMap(e.data() as Map<String,dynamic>)).toList();
          print("Length of Document        ${data.length}");
            if(data.length==0){
              return Center(child: Text('No Blocked Users',style: TextStyle(color: Colors.red,fontSize: 16),));
          }
            else{
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var innerdata=data[index];
                    return ItemAdminUserLayout(
                      imageNo: innerdata.profilePicNo,
                      name: innerdata.Name,
                      phno: '${innerdata.countrycode} ${innerdata.phoneNumber}',
                      block: false,
                      userIDToBlockUnblock: innerdata.id, setthestate: this,
                    );
                  });
            }
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }

        return Center(child: Text('No Data Available',style: TextStyle(color: Colors.red,fontSize: 12.sp),));
      },),
    );
  }

  @override
  void callingSetState() {
    // TODO: implement callingSetState
    setState(() {});
  }
}
