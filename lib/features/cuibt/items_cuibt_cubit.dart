import 'package:bloc/bloc.dart';
import 'package:habit_tracker/model/items_model.dart';
import 'package:meta/meta.dart';

part 'items_cuibt_state.dart';

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
}
