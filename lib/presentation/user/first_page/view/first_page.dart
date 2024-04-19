import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ration_shop/core/constants/color.dart';

import '../../../common/confrmtn page/controller/controller.dart';
import '../../Second_page/view/second_page.dart';


class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size*351,),
            Container(
              height: size*50,
              width:  size*200,
              child: ElevatedButton(
                onPressed: () {
                  final provider=Provider.of<tile_controller>(context, listen:false);
                  provider.clearcollection();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: ColorTheme.maincolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                child: Text(
                  "User",
                  style: TextStyle(color: ColorTheme.primarycolor, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: size*50,),
            Container(
              height: size*50,
              width:  size*200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: ColorTheme.maincolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                child: Text(
                  "OWNER",
                  style: TextStyle(color: ColorTheme.primarycolor, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}