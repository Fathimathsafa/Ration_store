import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/controller.dart';
import '../../../core/constants/color.dart';
import '../../../global_widget/cnfrm_page.dart';

class Confirm_page extends StatelessWidget {
  String category;
  Confirm_page({required this.category});

  @override
  Widget build(BuildContext context) {
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
                crossAxisCount: 2, // Adjust the cross axis count as needed
                childAspectRatio: 1 / 1.5, // Adjust the aspect ratio as needed
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

      floatingActionButton: Container(width: 200,
          child: FloatingActionButton(onPressed: (){},
              child: Text("CONFIRM",style:TextStyle(
                  fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
              backgroundColor: ColorTheme.maincolor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}