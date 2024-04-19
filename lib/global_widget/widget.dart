import 'package:flutter/material.dart';

import '../core/constants/color.dart';


class Item_Widget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String totalprice;
  final String kg;
  VoidCallback?   onclick;

  Item_Widget({super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.totalprice,
    required this.kg,
    this.onclick});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(padding: EdgeInsets.all(10),
          child:Container(
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorTheme.maincolor, // Set border color here
                width: 2.0, // Set border width here
              ),),
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(image: DecorationImage(
                      image: NetworkImage("$image"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Item : $name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ColorTheme.maincolor),),
                          Text("Price/Kg : $price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ColorTheme.maincolor),),
                          Text("Weight : $kg",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ColorTheme.maincolor),),
                          Text("Total Price :$totalprice",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ColorTheme.maincolor),),
                        ]))
              ],
            ),
          )),
    );
  }
}