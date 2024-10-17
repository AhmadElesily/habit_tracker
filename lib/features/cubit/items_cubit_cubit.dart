import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/model/items_model.dart';

import 'items_cubit_state.dart';



class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());

  List<ItemModel> items = [];

  void addItemsToList(ItemModel itemModel) {
    items.add(itemModel);
    emit(ItemsSucceed(items));
  }

  void deleteItemsToList(int index) {
    items.removeAt(index);
    emit(ItemsSucceed(items));
  }
  void updateItemsInList(int index, ItemModel updatedItem) {
    items[index] = updatedItem;
    emit(ItemsSucceed(items));
  }

  int getCurrentDayIndex(selectedDay) {
    int today = selectedDay.weekday;
    print("Today Number____${today-1}");
    return today-1 ;
  }
  //== 7 ? 0 : today
  void loadHabitsForToday(selectedDay) {
    int currentDay = getCurrentDayIndex(selectedDay);
    List<ItemModel> todayHabits = items.where((habit) {
      return habit.selectedDays.contains(currentDay);
    }).toList();
    print("List of habits $todayHabits");
    emit(ItemsSucceed(todayHabits));
  }
}
