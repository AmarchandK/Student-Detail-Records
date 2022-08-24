import 'dart:convert';

import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color.fromARGB(60, 71, 66, 231),
            backgroundImage: MemoryImage(const Base64Decoder().convert(image)),
          ),
          const Positioned(
            bottom: 40,
            right: 40,
            child: Icon(
              Icons.add_a_photo,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
