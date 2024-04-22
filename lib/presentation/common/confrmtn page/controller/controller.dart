import 'package:flutter/material.dart';

class tile_controller with ChangeNotifier{
  var selectedTileIndices = [];
  late int total;
  List<Map<String, dynamic>> collection = [];

  //to clear

  void clearCollectiion(){
    collection.clear();
    selectedTileIndices.clear();
    total = 0;
    notifyListeners();
  }

  // to select the needed items

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
      collection.removeWhere((item) => item['Name'] == name);

      int num = int.tryParse(item['TotalPrice'] ?? '0') ?? 0 ;
      total-=num;
    }
    else{
      collection.add(item);

      // adding
      int num = int.tryParse(item['TotalPrice']?? '0')?? 0 ;
      total += num;
    }
    notifyListeners();
  }
}