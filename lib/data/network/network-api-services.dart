import 'dart:convert';
import 'dart:io';

import 'package:getx_project/data/app_exceptions.dart';
import 'package:getx_project/data/network/base-api-services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future<dynamic> getApi(String url)async {
    dynamic responsejson;
    try{
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson=returnResponse(response);
    }on SocketException{
      throw InternetException('No internet');
    }on RequestException{
      throw RequestException('Request exception');
    }
    return responsejson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException('Error occured while communicating with server ${response.statusCode}');
    }
  }

  @override
  Future postApi(String url) {
    // TODO: implement postApi
    throw UnimplementedError();
  }
  
  
}