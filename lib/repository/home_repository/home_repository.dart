
import 'package:getx_project/data/network/network-api-services.dart';
import 'package:getx_project/model/home/user_list_model.dart';
import 'package:getx_project/res/app_url/app_url.dart';

class HomeRepository{

  final _apiService =NetworkApiServices();

  Future<UserListModel> userListApi()async{
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    print(response);
    return UserListModel.fromJson(response);
  }



}