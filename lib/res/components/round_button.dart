import 'package:flutter/material.dart';
import 'package:getx_project/res/color/app_color.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
         Key? key,
         this.loading=false,
         required this.title,
         this.height=40,
         this.width=50,
         required this.onPress,
         this.textColor=AppColor.violetColor,
         this.buttonColor=AppColor.whiteColor
    }) : super(key: key);

  final bool loading;
  final String title;
  final double height,width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: loading?const Center(child: CircularProgressIndicator(),):
           Center(
             child: Text(title,style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
           ),
      ),
    );
  }
}
