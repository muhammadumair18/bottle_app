import 'package:bottle_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenAdminSettings extends StatefulWidget {
  const ScreenAdminSettings({Key? key}) : super(key: key);

  @override
  _ScreenAdminSettingsState createState() => _ScreenAdminSettingsState();
}

class _ScreenAdminSettingsState extends State<ScreenAdminSettings> {
  TextEditingController fullNameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              LocaleKeys.settings.tr,
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 6.sp),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.fullname.tr,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  TextField(controller: fullNameController,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                    // onChanged: (value) {
                    //   title = value;
                    // },
                    decoration: InputDecoration(
                      hintText: 'Jacob Jones',
                      fillColor: Color(0xFFF6F6F6),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.email.tr,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  TextField(controller: emailController,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                    // onChanged: (value) {
                    //   title = value;
                    // },
                    decoration: InputDecoration(
                      hintText: 'Example123@gmail.com',
                      fillColor: Color(0xFFF6F6F6),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.password.tr,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  TextField(controller: passwordController,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                    // onChanged: (value) {
                    //   title = value;
                    // },
                    decoration: InputDecoration(
                      hintText: 'abc123@password',
                      fillColor: Color(0xFFF6F6F6),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 55.sp),
                  child: Text(
                    LocaleKeys.save.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
