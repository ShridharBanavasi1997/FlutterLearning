import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rest_api_example/user_list/models/user_list_model.dart';
import 'package:rest_api_example/user_list/repo/api_status.dart';
import 'package:rest_api_example/utils/constants.dart';

class UserServices{
  static Future<Object> getUser() async{
    try{
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      if(200 == response.statusCode){
        return Success(response:userListModelFromJson(response.body));
      }
      return Failure(code:USER_INVALID_RESPONSE,errorResponse: 'Invalid Response');
    }on HttpException{
      return Failure(code:NO_INTERNET,errorResponse: 'No Internet');
    }on FormatException{
      return Failure(code:INVALID_FORMAT,errorResponse: 'Invalid Format');
    }
    catch(e){
      return Failure(code:UNKNOWN_ERROR,errorResponse: 'Unknown Error');
    }
  }
}