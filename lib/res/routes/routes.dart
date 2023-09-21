import 'package:get/get.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view/log_in/login_view.dart';
import 'package:getx_project/view/splash_screen.dart';

class AppRoutes{

   static appRoutes()=>[
        GetPage(
            name: RouteName.splashScreen,
            page: ()=>const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)

        ),
     GetPage(
         name: RouteName.loginView,
         page: ()=>const LogInView(),
         transition: Transition.leftToRightWithFade,
         transitionDuration: const Duration(milliseconds: 250)

     )


   ];

}