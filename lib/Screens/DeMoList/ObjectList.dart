import 'package:flutter/material.dart';

class SelectObject {
  String title;
  String imageUrl;
  bool _isSelected = false;
  SelectObject({required this.title, required this.imageUrl});
  void swapSelect(){
    _isSelected = !_isSelected;
  }
  bool get isSelected => _isSelected; // isSelect getter
}