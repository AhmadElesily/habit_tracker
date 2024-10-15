part of 'items_cuibt_cubit.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}
final class ItemsSucceed extends ItemsState {
  final List <ItemModel> items ;
ItemsSucceed(this.items);

}
