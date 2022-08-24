import 'dart:convert';
import 'package:flutter/material.dart';
import '../../db/functions/db_functions.dart';
import '../../db/models/data_model.dart';
import '../view/view_screen.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> studentList,
            Widget? child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data = studentList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color:const Color.fromARGB(255, 127, 124, 204),
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          deleteStudent(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewScreen(data: data, index: index),),);
                      },
                      leading: CircleAvatar(
                          backgroundImage: MemoryImage(
                              const Base64Decoder().convert(data.image),),
                          radius: 30),
                      title: Text(data.name),
                      subtitle: Text(data.age),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: studentList.length);
        });
  }
}
