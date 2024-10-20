import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/model/items_model.dart';
import 'package:hive/hive.dart';
import 'items_cubit_state.dart';


class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());
  final habitsBox = Hive.box('habits');
  List<ItemModel> items = [];


  void fetchTodos() {
    for (final item in habitsBox.toMap().values) {
      final habit = ItemModel(
        text: item['text'],
        selectedDays: item['selectedDays'],
        color: item['color'],
        isSelected: item['isSelected'],
        iconImage: item['iconImage'],
      );
      items.add(habit);
    }
  }

  void addItemsToList(ItemModel itemModel) {
    habitsBox.add({
      'text': itemModel.text,
      'iconImage': itemModel.iconImage,
      'isSelected': itemModel.isSelected,
      'selectedDays': itemModel.selectedDays,
      'color': itemModel.color,
    });

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
