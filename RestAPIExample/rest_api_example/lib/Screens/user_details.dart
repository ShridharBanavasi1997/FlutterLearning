import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_example/components/app_title.dart';
import 'package:rest_api_example/user_list/view_models/user_view_model.dart';

class UserDetailsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('User Details'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userViewModel.selectedUser.name!,
            ),
            Text(
              userViewModel.selectedUser.email!,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

}