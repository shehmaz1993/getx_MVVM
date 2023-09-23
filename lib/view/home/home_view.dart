import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/res/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(RouteName.loginView);
           },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(child: Text("Home")),
    );
  }
}
