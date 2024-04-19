import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ration_shop/core/constants/color.dart';

import '../../Second_page/view/second_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD3pwLu5HinkOq528NGq_EWsVqVdqHly_Q",
          appId: "1:136250585879:android:1aeb19d3f37ad45702fd52",
          storageBucket: "rationshop-518f0.appspot.com",
          messagingSenderId: "",
          projectId: "rationshop-518f0"
      ),
    );
  } catch (e) {
    print("Error initializing Firebase: $e");
    return;
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: First_Page(),
  ));
}

class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size*350,),
            Container(
              height: size*50,
              width:  size*200,
              child: ElevatedButton(
                onPressed: () {
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