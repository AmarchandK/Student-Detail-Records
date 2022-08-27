import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details/controllers/student_controller.dart';
import '../view/view_screen.dart';

class StudentList extends StatelessWidget {
  StudentList({Key? key}) : super(key: key);
  final StudentController _controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(builder: (studentController) {
      return ListView.separated(
          itemBuilder: (context, index) {
            final data = _controller.studentList[index];
            log(data.toString());
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: const Color.fromARGB(255, 127, 124, 204),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      _controller.deleteStudent(data);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () => Get.to(ViewScreen(data: data, index: index)),
                  leading: CircleAvatar(
                      backgroundImage: MemoryImage(
                        const Base64Decoder().convert(data.image),
                      ),
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
          itemCount: _controller.studentList.length);
    });
  }
}
