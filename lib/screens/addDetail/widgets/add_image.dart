import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddImage extends StatelessWidget {
   AddImage({
    Key? key,
    required this.image,
  }) : super(key: key);

   RxString image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 50,
              backgroundColor: const Color.fromARGB(60, 71, 66, 231),
              backgroundImage:
                  MemoryImage(const Base64Decoder().convert(image.value)),
            ),
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
