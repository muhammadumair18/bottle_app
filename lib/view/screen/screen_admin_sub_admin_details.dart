import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/model/sub_admins.dart';
import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:custom_utils/custom_utils.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenAdminSubAdminDetails extends StatefulWidget {

  SubAdmins subadmindetail;

  @override
  _ScreenAdminSubAdminDetailsState createState() => _ScreenAdminSubAdminDetailsState();

  ScreenAdminSubAdminDetails({
    required this.subadmindetail,
  });
}

class _ScreenAdminSubAdminDetailsState extends State<ScreenAdminSubAdminDetails> {

  bool _shareStory=false;
  bool _seeUsers=true;
  bool _sendNotifications=false;
  bool _blockUser=true;
  bool _deleteUserPost=true;
  bool isLoadingValue=false;


  @override
  Widget build(BuildContext context) {
    return CustomProgressWidget(
      loading: isLoadingValue,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),color: Colors.black,),
          title: Center(child: Text('Sub Admins Details',style: TextStyle(color: Colors.black),)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                // color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 13.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subadmindetail.fullName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.black),
                    ),
                    Text(
                      widget.subadmindetail.emal,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff707070)),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width,
                // margin: EdgeInsets.symmetric(vertical: 3.sp,horizontal: 3.sp),
                padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 13.sp),
                color: Colors.black.withOpacity(.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Permissions',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: Colors.black),)
                  ],
                ),
              ),
              // ListTile(
              //   title: Text('Share Story',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),
              //   trailing: CustomSw,
              // ),
              CustomSwitchListTile(value: widget.subadmindetail.shareStory, onChanged: (value){
                setState(() {
                  _shareStory=value;
                });
              },
                title: Text('Share Story',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),),
              CustomSwitchListTile(value: widget.subadmindetail.seeUsers, onChanged: (value){
                setState(() {
                  _seeUsers=value;
                });
              },
                title: Text('See Users',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),),
              CustomSwitchListTile(value: widget.subadmindetail.sendNotification, onChanged: (value){
                setState(() {
                  _sendNotifications=value;
                });
              },
                title: Text('Send Notifications',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),),
              CustomSwitchListTile(value: widget.subadmindetail.bockUser, onChanged: (value){
                setState(() {
                  _blockUser=value;
                });
              },
                title: Text('Block User',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),),
              CustomSwitchListTile(value: widget.subadmindetail.deleteUserPost, onChanged: (value){
                setState(() {
                  _deleteUserPost=value;
                });
              },
                title: Text('Delete User Post',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp),),),
              SizedBox(height: 50.sp,),
              GestureDetector(onTap: () async{
                await updateSwichData();
              },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(width: 1.sp,color: Colors.black)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 35.sp),
                  child: Text('Save Data',style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  await subadminref.doc('${widget.subadmindetail.createdbyAdmin}on${widget.subadmindetail.timeCreated}').delete();
                  Get.offAll(ScreenAdminDashbord());
                  Get.snackbar('SubAdmin Deleted', '${widget.subadmindetail.fullName} having Email ${widget.subadmindetail.emal} has been deleted.',backgroundColor: Colors.green,colorText: Colors.black);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(width: 1.sp,color: Colors.red)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 35.sp),
                  child: Text('Remove SubAdmin',style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<void> updateSwichData() async{
    setState(() {isLoadingValue=true;});
    await subadminref.doc('${widget.subadmindetail.createdbyAdmin}on${widget.subadmindetail.timeCreated}').update({'shareStory':_shareStory,
      'seeUsers':_seeUsers,
      'sendNotification':_sendNotifications,
      'bockUser':_blockUser,
      'deleteUserPost':_deleteUserPost}).then((value) {
      // Get.back();
      setState(() {isLoadingValue=false;});
      Get.snackbar('Updated Successfully', 'The SubAdmin data has been updated.',backgroundColor: Colors.green,colorText: Colors.black);
    }).catchError((onError){
      Get.snackbar('Error', onError.toString(),backgroundColor: Colors.red,colorText: Colors.black);
    });
  }

}
