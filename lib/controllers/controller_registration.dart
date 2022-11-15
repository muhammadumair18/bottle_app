import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController{

  RxBool checkBoxValue=false.obs;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  RxBool isloading=false.obs;




  final emailController=TextEditingController().obs;
Rx<TextEditingController> passwordController=TextEditingController().obs;

Future<void> registerAccount() async{
  String responce='';
  String email=emailController.value.text;
  String password=passwordController.value.text;

  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
    responce="success";
    Get.snackbar("Registration", 'The user has been successfully regsiterd');
    Get.offAll(ScreenAdminDashbord());
  }).onError((error, stackTrace) {
    Get.snackbar("Registration", error.toString());
  });
}

Future<void> loginAccount() async{
  isloading.value=true;
  String responce='';
  String email=emailController.value.text;
  String password=passwordController.value.text;

  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password).then((value) {
    responce="success";
    Get.snackbar("Login", 'The user has been successfully logged In',backgroundColor: Colors.green);
    Get.offAll(ScreenAdminDashbord());
    isloading.value=false;
  }).onError((error, stackTrace) {
    isloading.value=false;
    Get.snackbar("login", error.toString(),backgroundColor: Colors.red);
  });
}

String? validateEmail(String value){
  if(!value.isEmail){
    return 'Enter Valid Email';
  }
  return null;
}

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password at least 6";
    }
    return null;
  }


}
