// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class Buttons extends StatelessWidget {
  void Function()? function;
  final String label;
  Buttons({
    required this.function,
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color:themeColor,
      minWidth: 380,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      onPressed: function,
      child:  Text(
        label,
        style:const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
