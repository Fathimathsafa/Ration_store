import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ration_shop/core/constants/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../card_page/view/card_page.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // try {
//   //   await Firebase.initializeApp(
//   //     options: FirebaseOptions(
//   //       apiKey: "AIzaSyD3pwLu5HinkOq528NGq_EWsVqVdqHly_Q",
//   //       appId: "1:136250585879:android:1aeb19d3f37ad45702fd52",
//   //       storageBucket: "rationshop-518f0.appspot.com",
//   //       messagingSenderId: "",
//   //       projectId: "rationshop-518f0"
//   //     ),
//   //   );
//   // } catch (e) {
//   //   print("Error initializing Firebase: $e");
//   //   return;
//   // }
//
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SecondPage(),
//   ));
// }

class SecondPage extends StatelessWidget {
  final ration_num = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: size * 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ColorTheme.secondaryycolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: ration_num,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                hintText: 'Ration Card Number',
                hintStyle: TextStyle(color: ColorTheme.maincolor, fontSize: size * 14),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: size * 20),
          Container(
            width: size * 200,
            padding: EdgeInsets.symmetric(horizontal: size * 10),
            decoration: BoxDecoration(
              color: ColorTheme.secondaryycolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: pass,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: ColorTheme.maincolor, fontSize: size * 14),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: size * 30),
          ElevatedButton(
            onPressed: () => _signIn(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.maincolor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: Text("OK", style: TextStyle(color: ColorTheme.primarycolor)),
          )
        ]),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    final String rationCardNumber = ration_num.text;
    final String password = pass.text;

    if (rationCardNumber.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter ration card number and password.'), backgroundColor: ColorTheme.maincolor),
      );
      return;
    }

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ration card owner')
          .where('number', isEqualTo: rationCardNumber)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        String category = documentSnapshot['category'];
        Navigator.push(context, MaterialPageRoute(builder: (context) => CardPage(category: '$category',)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid ration card number or password.'), backgroundColor: ColorTheme.maincolor),
        );
      }
    } catch (e) {
      print("Error querying Firestore: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.'), backgroundColor: ColorTheme.maincolor),
      );
    }
  }
}


