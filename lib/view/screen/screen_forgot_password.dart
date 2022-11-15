import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenForgotPassword extends StatelessWidget {
  const ScreenForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 45.sp,
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 9.sp,
                  ),
                  Text(
                    'Enter your email to recover your password',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 3,
                    offset: Offset(1,1)
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(30.0))
            ),
              child: TextField(
                style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                // onChanged: (value) {
                //   title = value;
                // },
                decoration: InputDecoration(hintStyle: TextStyle(color: Colors.black.withOpacity(.5),fontSize: 17),
                  hintText: 'Email',
                  fillColor: Color(0xFFF6F6F6),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
              ),
            ),
            GestureDetector(onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * .15),
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.sp),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          spreadRadius: 5
                      )
                    ]
                ),
                child: Center(
                  child: Text('Send',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
