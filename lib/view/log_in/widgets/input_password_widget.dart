import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_model/controller/login/login_view_model.dart';



class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);
  final loginVM= Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
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
    );
  }
}
