
import 'package:getx_project/data/network/network-api-services.dart';
import 'package:getx_project/res/app_url/app_url.dart';

class LoginRepository{

  final _apiService =NetworkApiServices();

  Future<dynamic> loginApi(var data)async{
    dynamic response = await _apiService.postApi(AppUrl.loginApi, data);
    return response;
  }



}