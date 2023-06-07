import 'dart:collection';

import 'package:flutter/material.dart';

import '../Models/Item.dart';

class Cart with ChangeNotifier{
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  int get totalPrice => _items.length * 10;


  void add(Item item)
  {
    _items.add(item);
    notifyListeners();
  }

  void remove(String id)
  {
    _items.removeWhere((item)=>item.id == id);
    notifyListeners();

  }
}