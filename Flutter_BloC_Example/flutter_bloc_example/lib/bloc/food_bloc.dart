
import 'package:flutter_bloc_example/events/food_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/model/foods.dart';

class FoodBloc extends Bloc<FoodEvent, List<Foods>>{
  @override
  List<Foods> get initialState => <Foods>[];

  @override
  Stream<List<Foods>> mapEventToState(FoodEvent event) async* {
    switch(event.foodEventType){
      case FoodEventType.add:
        List<Foods> newState = List.from(state);
        if(event.food != null){
          newState.add(event.food);
        }
        yield newState;
        break;
      case FoodEventType.delete:
        List<Foods> newState = List.from(state);
        print(newState.length);
        newState.removeAt(event.foodIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }



}