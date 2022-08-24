import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String name;
  final TextEditingController controler;
  final TextInputType keybord;
  const TextFields({
    Key? key,
    required this.name,
    required this.controler,
    required this.keybord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(141, 100, 118, 223),
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Invalid';
            } else {
              return null;
            }
          },
          controller: controler,
          keyboardType: keybord,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: name,
          ),
        ),
      ),
    );
  }
}
