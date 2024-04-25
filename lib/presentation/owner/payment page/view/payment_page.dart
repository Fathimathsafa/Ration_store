
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ration_shop/core/constants/color.dart';
import 'package:ration_shop/presentation/user/first_page/view/first_page.dart';


class Payment_page extends StatefulWidget {




  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
@override
  void initState() {
Timer(Duration(seconds: 3),(){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>First_Page()));
}) ;
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.maincolor ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child:  Lottie.asset("assets/Animation - 1711328118289 (3).json"),
              ),
              Text("CONFIRM ",style: TextStyle(color: ColorTheme.primarycolor),)
            ],
          ),
        ),
      ),
    );
  }
}
