import 'package:flutter/material.dart';
import 'package:rest_api_example/user_list/models/user_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel? userModel;
  final Function()? onTap;
  UserListRow({this.userModel,this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                text: userModel!.name!,
              ),
              Text(
                userModel!.email!,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
    );
  }
}
