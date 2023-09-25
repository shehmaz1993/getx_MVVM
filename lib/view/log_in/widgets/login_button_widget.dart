import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/color/app_color.dart';
import '../../../res/components/round_button.dart';
import '../../../view_model/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;
  LoginButtonWidget({Key? key, this.formkey}) : super(key: key);
  final loginVM= Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  RoundedButton(
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
    );
  }
}
