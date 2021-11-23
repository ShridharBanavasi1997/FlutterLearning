import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_example/Screens/add_user.dart';
import 'package:rest_api_example/Screens/user_details.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => UserDetailsScreen()));
}

void openAddUser(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddUserScreen()));
}