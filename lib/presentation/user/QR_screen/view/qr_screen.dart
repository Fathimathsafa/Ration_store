import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/constants/color.dart';

class qr_image_page extends StatelessWidget {
  List<Map<String, dynamic>> datas;
  qr_image_page({required this.datas});
  @override
  Widget build(BuildContext context) {
    String data = json.encode(datas);
    return  Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(
        child: QrImageView(
          backgroundColor: Colors.white,
          data: data,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}