import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/interface/setstate_listener.dart';
import 'package:bottle_app/view/screen/screen_admin_user_detail.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemAdminUserLayout extends StatefulWidget {
  int imageNo;
  String name,phno;
  bool block;
  String userIDToBlockUnblock;
  SetstateListener setthestate;


  @override
  _ItemAdminUserLayoutState createState() => _ItemAdminUserLayoutState();

  ItemAdminUserLayout({
    required this.imageNo,
    required this.name,
    required this.phno,
    required this.block,
    required this.userIDToBlockUnblock,
    required this.setthestate
  });
}

class _ItemAdminUserLayoutState extends State<ItemAdminUserLayout> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 4.sp),
          child: ListTile(
            onTap: (){
              Get.to(ScreenAdminUserDetail(UserIdToGetDetails: widget.userIDToBlockUnblock,));
            },
            leading: Container(
              height: Get.height * .13,
              width: Get.width * .13,
              decoration: BoxDecoration(
                  // border: Border.all(width: 1.sp, color: Colors.red),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/image ${widget.imageNo}.png'))),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.phno,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400,color: Colors.black.withOpacity(.5)),
                ),
              ],
            ),
            trailing:widget.block==true ?
            GestureDetector(onTap: (){
              showDialog(context: context,builder: (context){return AlertDialog(
                  title: Text(LocaleKeys.alert.tr),
                  content: Text(LocaleKeys.areyousureyouwanttoblockthisuser.tr),
                  actions: [
                    OutlinedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await userref.doc(widget.userIDToBlockUnblock).update({"isblocked": true}).then((value) {
                            Get.snackbar(LocaleKeys.blocked.tr, "${widget.name} ${LocaleKeys.hasbeenblocked.tr}",backgroundColor: Colors.black,colorText: Colors.white,);
                            widget.setthestate.callingSetState();
                          }).onError((error, stackTrace) {
                            Get.snackbar(LocaleKeys.error.tr, error.toString(),backgroundColor: Colors.red,colorText: Colors.black,);
                          });
                        },
                        child: Text(LocaleKeys.yes.tr)),
                    OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(LocaleKeys.no.tr)),
                  ],
                );
              });
            },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                child: Text(
                  LocaleKeys.block.tr,
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500, fontSize: 15.sp),
                ),
              ),
            ):
            GestureDetector(onTap: () async{
              showDialog(context: context,builder: (context){return AlertDialog(
                title: Text(LocaleKeys.alert.tr),
                content: Text(LocaleKeys.areyousureyouwanttounblockthisuser.tr),
                actions: [
                  OutlinedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await userref.doc(widget.userIDToBlockUnblock).update({"isblocked": false}).then((value) {
                          Get.snackbar(LocaleKeys.unblocked.tr, "${widget.name} ${LocaleKeys.unblocked}",backgroundColor: Colors.black,colorText: Colors.white,);
                          widget.setthestate.callingSetState();
                        }).onError((error, stackTrace) {
                          Get.snackbar(LocaleKeys.error.tr, error.toString(),backgroundColor: Colors.red,colorText: Colors.black,);
                        });
                      },
                      child: Text(LocaleKeys.yes.tr)),
                  OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(LocaleKeys.no.tr)),
                ],
              );
              });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(color: Colors.black)
                ),
                child: Text(LocaleKeys.unblock.tr,style: TextStyle(
                    fontSize: 14.sp,fontWeight: FontWeight.w500
                ),),
              ),
            )
          ),
        ),
        widget.block?Container(height: 1.sp,color: Color(0xffBEBEBE),):SizedBox(),
      ],
    );
  }


}
