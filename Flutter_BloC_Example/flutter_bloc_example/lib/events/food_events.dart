
import 'package:flutter_bloc_example/model/Food.dart';
import 'package:flutter_bloc_example/model/foods.dart';

enum FoodEventType{add,delete}

class FoodEvent{
  late Foods food;
  late int foodIndex;
  late FoodEventType foodEventType;

  FoodEvent.add(this.food){
    foodEventType=FoodEventType.add;
  }

  FoodEvent.delete(int index){
    foodIndex=index;
    foodEventType=FoodEventType.delete;
  }
}