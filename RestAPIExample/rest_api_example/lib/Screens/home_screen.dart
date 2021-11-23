import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_example/components/app_loading.dart';
import 'package:rest_api_example/components/user_list_row.dart';
import 'package:rest_api_example/user_list/models/user_list_model.dart';
import 'package:rest_api_example/user_list/view_models/user_view_model.dart';
import 'package:rest_api_example/utils/navigation_utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          )
        ],
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [_ui(userViewModel)],
        ),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return AppLoading();
    }
    if (userViewModel.isError()) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = userViewModel.userListModel[index];
            return UserListRow(
              userModel: userModel,
              onTap: () async {
                userViewModel.setSelectedUser(userModel);
                openUserDetails(context);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: userViewModel.userListModel.length),
    );
  }
}
