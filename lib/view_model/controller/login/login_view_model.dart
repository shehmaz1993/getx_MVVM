
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_project/model/login/user_model.dart';
import 'package:getx_project/repository/login_repository/login_repository.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view_model/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController{
   final _api =LoginRepository();
   final emailController =TextEditingController().obs;
   final passwordController =TextEditingController().obs;
   final emailFocusNode =FocusNode().obs;
   final passwordFocusNode =FocusNode().obs;
   UserPreferences userPreferences=UserPreferences();

   RxBool loading = false.obs;
   void loginApi(){
      loading.value=true;
      Map data={
         'email':emailController.value.text,
         'password':passwordController.value.text
      };
    
      _api.loginApi(data).then((value){
          loading.value=false;
          if(value['error']== 'user not found'){
            Utils.snackBar('Login', value['error']);
          }
          else{
            UserModel userModel =UserModel(
              token: data['token'],
              isLogin: true
            );
            userPreferences.saveUser(userModel).then((value){
                Get.delete<LoginViewModel>();
                Get.toNamed(RouteName.homeView);
            }).onError((error, stackTrace) {
               print(error.toString());
            });
            Utils.snackBar('Login', 'Login successful');
          }

      }).onError((error, stackTrace){
          loading.value=false;
          Utils.snackBar('Error', error.toString());
      });

   }

}