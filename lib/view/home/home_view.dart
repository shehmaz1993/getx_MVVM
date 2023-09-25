import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/res/components/general_exception_widget.dart';
import 'package:getx_project/res/components/internet_exception-widgets.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view_model/controller/home/home_view_model.dart';
import 'package:getx_project/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController =Get.put(HomeController());
  UserPreferences userPreferences=UserPreferences();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            }).onError((error, stackTrace) {

            });
           },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body:  Obx(() {
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value =='No internet'){
              return InterNetExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
            }
            else{
              return GeneralExceptionWidget(
                  onPress: (){
                    homeController.refreshApi();
                  });
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context,index){
                // print('data is ${homeController.userList.value.data![index].email}');
                 return ListTile(
                  leading: CircleAvatar(
                     backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                   ),
                   title: Text(homeController.userList.value.data![index].firstName.toString()),
                   subtitle: Text(homeController.userList.value.data![index].email.toString()),
                 );
            });
        }
      }),
    );
  }
}
