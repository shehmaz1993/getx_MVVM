import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/color/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: height*.15,),
            const Icon(Icons.cloud_off,color: AppColor.redColor,size: 50,),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text('internet_exception'.tr),
              ),
            ),
            SizedBox(height: height*.15,),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                height: 44,
                width: 100,
                color: AppColor.violetColor,
                child: const Center(child: Text('Retry')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
