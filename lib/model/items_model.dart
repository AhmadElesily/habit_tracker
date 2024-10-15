import 'package:flutter/material.dart';

class ItemModel {
  String text;
  Image iconImage;
  Color color;
  bool isSelected;

  ItemModel({
    this.isSelected = false,
    required this.text,
    required this.iconImage,
    required this.color,
  });
}
