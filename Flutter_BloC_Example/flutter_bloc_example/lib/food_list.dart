import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/food_bloc.dart';

import 'events/food_events.dart';
import 'model/foods.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<FoodBloc, List<Foods>>(
          buildWhen: (List<Foods> previous, List<Foods> current) {
            return true;
          },
          listenWhen: (List<Foods> previous, List<Foods> current) {
            if (current.length > previous.length) {
              return true;
            }

            return false;
          },
          builder: (context, foodList) {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(foodList[index].name),
                    onTap: () => BlocProvider.of<FoodBloc>(context).add(
                      FoodEvent.delete(index),
                    ),
                  ),
                );
              },
            );
          },
          listener: (BuildContext context, foodList) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Added!')),
            );
          },
        ));
  }
}