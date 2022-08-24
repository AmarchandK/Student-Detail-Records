import 'dart:convert';
import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import '../../db/models/data_model.dart';
import '../edit/edit_screen.dart';

// ignore: must_be_immutable
class ViewScreen extends StatelessWidget {
  StudentModel data;
  int? index;
  ViewScreen({Key? key, required this.data, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: baground,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(data.image)),
                  radius: 120,
                ),
              ),
              CardsWidget(
                item: data.name,
              ),
              CardsWidget(
                item: data.phone,
              ),
              CardsWidget(
                item: data.age,
              ),
              CardsWidget(
                item: data.domain,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EditPage(
                  data: data,
                  index: index,
                ),
              ),
            );
          },
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}

class CardsWidget extends StatelessWidget {
  final String item;
  const CardsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: themeColor, blurRadius: 20, offset: Offset(0, 10))
              ]),
          child: Center(
              child: Text(
            item,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: themeColor),
          ))),
    );
  }
}
