import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/interface/setstate_listener.dart';
import 'package:bottle_app/model/user.dart' as model;
import 'package:bottle_app/view/layout/item_admin_users_block_and_unblock_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAdminUser extends StatefulWidget {
  const ScreenAdminUser({Key? key}) : super(key: key);

  @override
  _ScreenAdminUserState createState() => _ScreenAdminUserState();
}

class _ScreenAdminUserState extends State<ScreenAdminUser> implements SetstateListener{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Center(child: Text('Users',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: userref.where('isblocked',isEqualTo:false).get(),
        builder: ( context,  snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        if(snapshot.hasData){
          var data=snapshot.data!.docs.map((e) => model.User.fromMap(e.data() as Map<String,dynamic>)).toList();
          print(data.length);
            if(data.length == 0){
            return Center(child: Text('No Data Available',style: TextStyle(color: Colors.red,fontSize: 12),));
          }
          else{
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var innerdata=data[index];
                return ItemAdminUserLayout(
                  imageNo: innerdata.profilePicNo,
                  name: innerdata.Name,
                  phno: '${innerdata.countrycode}${innerdata.phoneNumber}',
                  block: true,
                  userIDToBlockUnblock: innerdata.id,
                setthestate: this,);
              },
              itemCount: data.length,
            );
          }
        }
        return Center(child: Text("No Data Available",style: TextStyle(color: Colors.red,fontSize: 12),),);
      },),
    );
  }

  @override
  void callingSetState() {
    // TODO: implement callingSetState
    setState(() {});
  }

}
