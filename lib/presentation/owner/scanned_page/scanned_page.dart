import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/color.dart';
import '../../../global_widget/cnfrm_page.dart';
import '../payment page/view/payment_page.dart';


class Scanned_Page extends StatelessWidget {
  final String data;
  Scanned_Page({required this.data});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listOfMaps = json.decode(data).cast<Map<String, dynamic>>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text("QR Code Scanner",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the cross axis count as needed
            childAspectRatio: 1 / 1.5, // Adjust the aspect ratio as needed
          ),
          itemCount: listOfMaps.length,
          itemBuilder: (BuildContext context, int index) {
            return Confirm_Item_Widget(
              item: listOfMaps[index],
            );
          },
        ),
      ),

      floatingActionButton: Container(color: ColorTheme.maincolor,
        width: double.infinity,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                  child: Text("Total Amount: ₹300",style:TextStyle(
                      fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)),
            ),
            Container(width: 130,
                color: ColorTheme.maincolor,
                child: FloatingActionButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment_page()));
                },
                  child: Text("CONFIRM",style:TextStyle(
                      fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
                  backgroundColor: ColorTheme.maincolor,
                  elevation: 0,)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}