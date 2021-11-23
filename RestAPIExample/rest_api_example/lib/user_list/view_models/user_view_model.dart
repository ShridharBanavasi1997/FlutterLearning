import 'package:flutter/material.dart';
import 'package:rest_api_example/user_list/models/user_error_model.dart';
import 'package:rest_api_example/user_list/models/user_list_model.dart';
import 'package:rest_api_example/user_list/repo/api_status.dart';
import 'package:rest_api_example/user_list/repo/user_servicess.dart';

class UserViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError!;
  UserModel get selectedUser => _selectedUser!;
  UserModel get addingUser => _addingUser;

  UserViewModel(){
    getUsers();
  }

  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError){
    _userError = userError;
  }

  setSelectedUser(UserModel userModel){
    _selectedUser = userModel;
  }

  Future<bool> addUser()async{
    if(!isValid()){
      return false;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  bool isValid(){
    if(addingUser.name == null || addingUser.name!.isEmpty){
      return false;
    }
    if(addingUser.email == null || addingUser.email!.isEmpty){
      return false;
    }
    return true;
  }

  getUsers() async{
    setLoading(true);
    var response = await UserServices.getUser();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
      _userError = null;
    }
    if(response is Failure){
      UserError userError = UserError(response.code, response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  bool isError(){
    if(_userError != null){
      return true;
    }
    return false;
  }
}