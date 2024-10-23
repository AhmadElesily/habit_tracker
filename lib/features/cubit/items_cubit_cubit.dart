import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/model/items_model.dart';
import 'package:hive/hive.dart';

import 'items_cubit_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());
  final habitsBox = Hive.box('habits');
  List<ItemModel> habits = [];

  List<ItemModel> fetchHabits() {
    for (final item in habitsBox.values) {
      final Color itemColor = Color(item['color']); // get color

      RegExp regExp = RegExp(r'name:\s*"(.*?)"'); // get image path
      Match? itemImagePath = regExp.firstMatch(item['iconImage'].toString());
      // print(itemImagePath!.group(1) ?? '');
      final itemImage = Image.asset(itemImagePath!.group(1) ?? '');

      final habit = ItemModel(
        text: item['text'],
        selectedDays: item['selectedDays'],
        color: itemColor,
        isSelected: item['isSelected'],
        iconImage: itemImage,
      );
      habits.add(habit);
    }
    return habits;
  }

  void addItemsToList(ItemModel itemModel) {
    habitsBox.add(itemModel.toMap());
    habits.add(itemModel);
    emit(ItemsSucceed(habits));
  }

  void deleteItem(ItemModel item,index) {
    final equality = ListEquality();
    final keyToDelete = habitsBox.keys.firstWhere((key) {
      final habitData = habitsBox.get(key);

      if (habitData is Map) {
        try {
          final habit = ItemModel.fromMap(habitData.cast<String, dynamic>());
          return habit.text == item.text &&
              habit.color == item.color &&
              equality.equals(habit.selectedDays, item.selectedDays);
        } catch (e) {
          print("Error converting habitData: $e");
          return false;
        }
      }
      // } else if (habitData is ItemModel) {
      //   return habitData.text == item.text &&
      //       habitData.color == item.color &&
      //       equality.equals(habitData.selectedDays, item.selectedDays);
      // }
      return false;
    }, orElse: () => null);

    if (keyToDelete != null) {
      habitsBox.delete(keyToDelete);
     // habits.removeAt(index);
      habits.removeWhere((habit) =>
              habit.text == item.text &&
              habit.color == item.color &&
              habit.iconImage == item.iconImage &&
              habit.selectedDays == item.selectedDays);
      emit(ItemsSucceed(habits));
    }
  }

  void updateItemsInList(int index, ItemModel updatedItem) {
    habitsBox.putAt(index, updatedItem.toMap());
    habits[index] = updatedItem;
    emit(ItemsSucceed(habits));
  }

  int getCurrentDayIndex(selectedDay) {
    int today = selectedDay.weekday;
    print("Today Number____${today - 1}");
    return today - 1;
  }

  //== 7 ? 0 : today
  void loadHabitsForToday(selectedDay, [List<ItemModel>? habitList]) {
    //habitsBox.clear();

    List<ItemModel> newList;
    int currentDay = getCurrentDayIndex(selectedDay);
    if (habitList != null) {
      newList = habitList.where((habit) {
        return habit.selectedDays.contains(currentDay);
      }).toList();
    } else {
      newList = habits.where((habit) {
        return habit.selectedDays.contains(currentDay);
      }).toList();
    }
    emit(ItemsSucceed(newList));
  }

  void initData() {
    List<ItemModel> listOfHabits = fetchHabits();
    loadHabitsForToday(DateTime.now(), listOfHabits);
  }
}
