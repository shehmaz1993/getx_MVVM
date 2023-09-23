import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_project/res/routes/routes.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view_model/controller/user_preference/user_preference_view_model.dart';

class SplashService{

   UserPreferences userPreferences=UserPreferences();
  void isLogin(){
   userPreferences.getUser().then((value){
     if (kDebugMode) {
       print(value.token);
       print(value.isLogin);
     }
     if(value.isLogin==false || value.isLogin.toString()=='null'){
       Timer(
           const Duration(seconds: 3),
               ()=> Get.toNamed(RouteName.loginView)
       );
     }else{
       Timer(
           const Duration(seconds: 3),
               ()=> Get.toNamed(RouteName.homeView)
       );
     }
   });


  }


}