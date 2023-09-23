import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/color/app_color.dart';
import 'package:getx_project/utils/utils.dart';

import '../../res/components/round_button.dart';
import '../../view_model/controller/login/login_view_model.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  final loginVM= Get.put(LoginViewModel());
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackBar('Email','Enter email');
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
                    },
                  ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: loginVM.passwordController.value,
                focusNode: loginVM.passwordFocusNode.value,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    hintText: 'password_hint'.tr,
                    border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value!.isEmpty){
                    Utils.snackBar('Password','Enter password');
                  }
                },
              ),
                  const SizedBox(height: 40,),
                 Obx(() =>  RoundedButton(
                   width: 500,
                   buttonColor: AppColor.violetColor,
                   textColor: AppColor.whiteColor,
                   loading: loginVM.loading.value,
                   title: 'login'.tr,
                   onPress: () {
                     if(formkey.currentState!.validate()){
                       loginVM.loginApi();
                     }
                   },)
                 )

            ],
          ),
        ),
      ),
    );
  }
}
