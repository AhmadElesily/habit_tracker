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

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      text: map['text'],
      selectedDays: List<int>.from(map['selectedDays']),
      color: Color(map['color']),
      isSelected: map['isSelected'],
      iconImage: Image.asset(map['iconImage']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'selectedDays': selectedDays,
      'color': color.value,
      'isSelected': isSelected,
      'iconImage': iconImage.image.toString(),
    };
  }
}