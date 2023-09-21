import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getx_project/res/assets/image_assets.dart';
import 'package:getx_project/res/components/internet_exception-widgets.dart';
import 'package:getx_project/view_model/services/splashscreen_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService=SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
     /* body:const Image(
        image: AssetImage(ImageAsset.splashScreen),
      ),*/
      body: InterNetExceptionWidget(onPress: () {  },),
    );
  }
}
