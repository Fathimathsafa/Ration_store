import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ration_shop/controller/controller.dart';
import 'package:ration_shop/presentation/first_page/view/first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD3pwLu5HinkOq528NGq_EWsVqVdqHly_Q",
        appId: "1:136250585879:android:1aeb19d3f37ad45702fd52",
        storageBucket: "rationshop-518f0.appspot.com",
        messagingSenderId: "",
        projectId: "rationshop-518f0"
    ),
  );
  runApp(mainpage());
}
class mainpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>tile_controller(),
    child: MaterialApp(debugShowCheckedModeBanner: false,
    home: First_Page(),
    ),);
  }
}



