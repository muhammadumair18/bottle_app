import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/model/sub_admins.dart';
import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ScreenAdminAddNewSubAdmin extends StatefulWidget {
  @override
  _ScreenAdminAddNewSubAdminState createState() => _ScreenAdminAddNewSubAdminState();
}

class _ScreenAdminAddNewSubAdminState extends State<ScreenAdminAddNewSubAdmin> {
  // TextEditingController fullnameController,emailController,PassowrdController=TextEditingController();
  TextEditingController fullNameController=TextEditingController(),
      emaiController=TextEditingController(),
      passwordController=TextEditingController();

  bool isLoadingValue=false;
  int selectedavatarindex = 1;

  @override
  Widget build(BuildContext context) {
    return CustomProgressWidget(
      loading: isLoadingValue,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
                LocaleKeys.addnewsubadmin.tr,
            style: TextStyle(color: Colors.black),
          )),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 12.sp,
                      ),
                      Container(
                        height: Get.height * .15,
                        width: Get.width * .30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.sp, color: Colors.black)),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/image ${selectedavatarindex}.png'),
                                      fit: BoxFit.contain)),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Center(
                                              child: Text(
                                                LocaleKeys.selectanavatar.tr,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: Get.height * .3,
                                                width: Get.width * .7,
                                                child: GridView(
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4,
                                                          mainAxisSpacing: 3.sp,
                                                          crossAxisSpacing: 10,
                                                          childAspectRatio: 0.8
                                                          // childAspectRatio: (2 / 3)
                                                          ),
                                                  children: [
                                                    for (int i = 1; i < 19; i++)
                                                      GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedavatarindex =
                                                                  i;
                                                            });
                                                            Get.back();
                                                          },
                                                          child: Image(
                                                              image: AssetImage(
                                                                  'assets/images/image ${i}.png')))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.limeAccent,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      TextField(controller: fullNameController,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.sp),
                        // onChanged: (value) {
                        //   title = value;
                        // },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.4), fontSize: 17),
                          hintText: LocaleKeys.fullname.tr,
                          fillColor: Color(0xFFF6F6F6),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      TextField(
                        controller: emaiController,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.sp),
                        // onChanged: (value) {
                        //   title = value;
                        // },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.4), fontSize: 17),
                          hintText: LocaleKeys.email.tr,
                          fillColor: Color(0xFFF6F6F6),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      TextField(
                        controller: passwordController,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.sp),
                        // onChanged: (value) {
                        //   title = value;
                        // },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.4), fontSize: 17),
                          hintText: LocaleKeys.password.tr,
                          fillColor: Color(0xFFF6F6F6),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      // SizedBox(height: 40.sp,),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // showDialog(context: context, builder: (context) {return AlertDialog(
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  //         content: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //               height: 100.sp,
                  //               width: 100.sp,
                  //               decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image:
                  //                         AssetImage('assets/images/tick.png')),
                  //                 borderRadius: BorderRadius.circular(60.sp),
                  //               ),
                  //               // child: Icon(
                  //               //   Icons.check_circle_outline,
                  //               //   size: 55.sp,
                  //               // )
                  //             ),
                  //             SizedBox(
                  //               height: 6.sp,
                  //             ),
                  //             Text(
                  //               'Added!',
                  //               style: TextStyle(
                  //                   fontSize: 20.sp, fontWeight: FontWeight.w500),
                  //             )
                  //           ],
                  //         ),
                  //       );});
                  setState(() {isLoadingValue=true;});
                  String inresponce=await _uploadDataOfSubAdmin();
                  if(inresponce=='success'){
                    Get.back();
                    Get.snackbar(LocaleKeys.subadminadded.tr,LocaleKeys.thesubadminaddedsuccessfully.tr,backgroundColor: Colors.green,colorText: Colors.black);
                  }
                  else{
                    Get.snackbar(LocaleKeys.error.tr,inresponce,backgroundColor: Colors.red,colorText: Colors.black);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 55.sp),
                  child: Text(
                    LocaleKeys.add.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _uploadDataOfSubAdmin() async{
    String responce='';
    String email=emaiController.value.text;
    String fullname=fullNameController.value.text;
    String password=passwordController.value.text;
    int datee=DateTime.now().millisecondsSinceEpoch;
    String currentUID=FirebaseAuth.instance.currentUser!.uid;
    if(!(email.isEmail)){
      return LocaleKeys.emailisbadlyformated.tr;
    }
    if(fullname.length<6 || password.length <6) {
        return LocaleKeys.eitherfullnameorpasswordisless.tr;
      }
    SubAdmins subadmin=SubAdmins(
        fullName: fullname,
        emal: email,
        password: password,
        profileImg: selectedavatarindex.toString(),
        createdbyAdmin: FirebaseAuth.instance.currentUser!.uid,
        shareStory: false,
        seeUsers: true,
        sendNotification: false,
        bockUser: true,
        deleteUserPost: true,
        timeCreated: datee);
    await subadminref.doc('${currentUID}on${datee}').set(subadmin.toMap()).then((value){
      responce='success';
    }).catchError((onError){
      responce=onError;
    });
    return responce;
   }
}






















