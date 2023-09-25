

import 'package:get/get.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/model/home/user_list_model.dart';
import 'package:getx_project/repository/home_repository/home_repository.dart';

class HomeController extends GetxController{

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error =''.obs;

  void setRxRequestStatus(Status status)=> rxRequestStatus.value=status;
  void setUserList(UserListModel model)=> userList.value=model;
  void setError(String value)=> error.value=value;
  void userListApi(){

    _api.userListApi().then((value){

      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);

    });
  }
  void refreshApi(){
     setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value){

      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }


}