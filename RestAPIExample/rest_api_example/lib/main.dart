import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_example/user_list/view_models/user_view_model.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: MaterialApp(
      title: 'Rest API Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomeScreen(),
    ));
  }
}

