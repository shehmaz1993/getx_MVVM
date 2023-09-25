import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/color/app_color.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view/log_in/widgets/input_email_widget.dart';
import 'package:getx_project/view/log_in/widgets/input_password_widget.dart';
import 'package:getx_project/view/log_in/widgets/login_button_widget.dart';

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
              InputEmailWidget(),
              const SizedBox(height: 20,),
              InputPasswordWidget(),
              const SizedBox(height: 40,),
              LoginButtonWidget(formkey: formkey,)

            ],
          ),
        ),
      ),
    );
  }
}
