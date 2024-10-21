import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/model/items_model.dart';
import 'package:hive/hive.dart';

import 'items_cubit_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());
  final habitsBox = Hive.box('habits');
  List<ItemModel> items = [];

  void fetchTodos() {
    for (final item in habitsBox.values) {
      final Color itemColor = Color(item['color']); // get color

      RegExp regExp = RegExp(r'name:\s*"(.*?)"'); // get image path
      Match? itemImagePath = regExp.firstMatch(item['iconImage'].toString());
      print(itemImagePath!.group(1) ?? '');
      final itemImage = Image.asset(itemImagePath!.group(1) ?? '');

      final habit = ItemModel(
        text: item['text'],
        selectedDays: item['selectedDays'],
        color: itemColor,
        isSelected: item['isSelected'],
        iconImage: itemImage,
      );
      items.add(habit);
    }
  }

  void addItemsToList(ItemModel itemModel) {
    habitsBox.add(itemModel.toMap());
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
    print("Today Number____${today - 1}");
    return today - 1;
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