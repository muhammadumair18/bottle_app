import 'package:bottle_app/controllers/controller_registration.dart';
import 'package:bottle_app/generated/locales.g.dart';
import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:bottle_app/view/screen/screen_forgot_password.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAdminLoginScreen extends StatelessWidget {
  RegistrationController _controller = Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFCFC),
      body: Obx(() {
        return CustomProgressWidget(
          loading: _controller.isloading.value,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: Get.height * .4,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)
                        )
                    ),
                    child: Center(
                      child: Text(LocaleKeys.sharebottle.tr,
                        style: TextStyle(color: Colors.white, fontSize: 33.sp),),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _controller.signupFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.sp,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.sp),
                            child: Text(LocaleKeys.adminlogin.tr, style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.sp),
                            child: Text(LocaleKeys.welcomeback.tr, style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 24.sp),
                            child: TextFormField(
                              validator: (value) {
                                _controller.validateEmail(value.toString());
                              },
                              controller: _controller.emailController.value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: hintColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: hintColor)),
                                  contentPadding: EdgeInsets.only(
                                      left: 15, right: 15, top: 5, bottom: 5),
                                  suffixIconConstraints: BoxConstraints(
                                      minWidth: 50.sp),
                                  hintText: LocaleKeys.email.tr
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 24.sp),
                            child: TextFormField(
                              controller: _controller.passwordController.value,
                              validator: (value) {
                                _controller.validatePassword(value.toString());
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),
                                suffixIconConstraints: BoxConstraints(
                                    minWidth: 50.sp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 1, color: hintColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: hintColor)),
                                hintText: LocaleKeys.password.tr,
                                suffixIcon: IconButton(onPressed: () {},
                                  icon: Icon(Icons.remove_red_eye),),
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: _controller.checkBoxValue
                                              .value,
                                          onChanged: (value) {
                                            _controller.checkBoxValue.value =
                                            value!;
                                          }),
                                      Text(LocaleKeys.Rememberme.tr, style: TextStyle(
                                          color: Color(0xff898989),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp),)
                                    ],
                                  ),
                                ),
                                GestureDetector(onTap: () {
                                  Get.to(ScreenForgotPassword());
                                },
                                    child: Text(
                                      LocaleKeys.forgotpassword.tr, style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),))
                              ],
                            ),
                          ),
                          SizedBox(height: 7.sp,),
                          GestureDetector(onTap: () {
                            _controller.loginAccount();
                          },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.sp),
                              padding: EdgeInsets.symmetric(vertical: 11.sp),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15.sp)
                              ),
                              child: Center(
                                child: Text(LocaleKeys.signin.tr, style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.sp,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}


// final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
