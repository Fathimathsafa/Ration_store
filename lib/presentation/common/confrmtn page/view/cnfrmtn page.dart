

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/color.dart';
import '../../../../global_widget/cnfrm_page.dart';
import '../../../user/QR_screen/view/qr_screen.dart';
import '../controller/controller.dart';

class Confirm_page extends StatelessWidget {
  String category;
  Confirm_page({required this.category});
//  List<Map<String, dynamic>> datalist =[];
  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> datas =
        Provider.of<tile_controller>(context).collection;
    Map<String, dynamic>combinedData = {
      'category':category,
      'price':Provider.of<tile_controller>(context).total,
      'mapList':datas,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text(category,style: TextStyle(color: Colors.white),),centerTitle: true,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white)
        ),
      ),
      body: Consumer<tile_controller>(
        builder: (context, provider, _) {
          List<Map<String, dynamic>> collection = provider.collection;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.6,
              ),
              itemCount: collection.length,
              itemBuilder: (BuildContext context, int index) {
                return Confirm_Item_Widget(
                  item: collection[index],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Container(color: ColorTheme.maincolor,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                  child: Text("Total Amount: ₹${Provider.of<tile_controller>(context).total}",style:TextStyle(
                      fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)),
            ),
            Container(width: 130,
                child: FloatingActionButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>qr_image_page(datas: combinedData,)));
                },
                  child: Text("CONFIRM",style:TextStyle(
                      fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
                  backgroundColor: ColorTheme.maincolor,
                  elevation: 0,)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}