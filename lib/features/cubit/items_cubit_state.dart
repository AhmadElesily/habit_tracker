
import 'package:flutter/cupertino.dart';

import '../../model/items_model.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}
final class ItemsSucceed extends ItemsState {
  final List <ItemModel> items ;
ItemsSucceed(this.items);

}
