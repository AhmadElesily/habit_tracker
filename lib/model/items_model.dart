import 'package:flutter/material.dart';

class ItemModel {
  String text;
  Image iconImage;
  Color color;
  bool isSelected;
  List<int> selectedDays;


  ItemModel({
    this.isSelected = false,
    required this.text,
    required this.iconImage,
    required this.color,
    required this.selectedDays,

  });
}
