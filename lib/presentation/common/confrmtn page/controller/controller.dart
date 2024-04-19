import 'package:flutter/material.dart';

class tile_controller with ChangeNotifier{
  var selectedTileIndices = [];
  late int total;
  List<Map<String, dynamic>> collection = [];
  void clearcollection(){
    collection.clear();
    selectedTileIndices.clear();
    total =0;
    notifyListeners();
  }
  void toggleTile(String name) {
    if (selectedTileIndices.contains(name)) {
      selectedTileIndices.remove(name);// Deselect if already selected
    } else {
      selectedTileIndices.add(name);
    }
    notifyListeners();
  }
  void togglenamelist( item, String name ){
    if (collection.contains(item)){
      collection.removeWhere((item) => item['name'] == name);
      int num= int.tryParse(item['total price']??'0')?? 0;
      total -= num;
    }
    else{
      collection.add(item);
      int num= int.tryParse(item['total price']??'0')?? 0;
      total += num;
    }
    notifyListeners();
  }
}