import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static showToast(String message){
    return Fluttertoast.showToast(
        msg: message,
       fontSize: 20,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.black,
      gravity: ToastGravity.CENTER,
    );
  }
}