
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_project/repository/login_repository/login_repository.dart';
import 'package:getx_project/utils/utils.dart';

class LoginViewModel extends GetxController{
   final _api =LoginRepository();
   final emailController =TextEditingController().obs;
   final passwordController =TextEditingController().obs;
   final emailFocusNode =FocusNode().obs;
   final passwordFocusNode =FocusNode().obs;

   RxBool loading = false.obs;
   void loginApi(){
      loading.value=true;
      Map data={
         'email':emailController.value.text,
         'password':passwordController.value.text
      };
    
      _api.loginApi(data).then((value){
          loading.value=false;
          Utils.snackBar('Login', 'Login successful');
      }).onError((error, stackTrace){
          loading.value=false;
          Utils.snackBar('Error', error.toString());
      });

   }

}