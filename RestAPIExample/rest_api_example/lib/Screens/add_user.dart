import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_example/user_list/view_models/user_view_model.dart';

class AddUserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Add User'),
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
                onPressed: ()async{
                  bool userAdded = await userViewModel.addUser();
                  if(!userAdded){
                    return;
                  }
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save)
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText:'Name'),
                onChanged: (val) async{
                  userViewModel.addingUser.name = val;
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: const InputDecoration(hintText:'email'),
                onChanged: (val) async{
                  userViewModel.addingUser.email = val;
                },
              )
            ],
          ),
        )
    );
  }
}
