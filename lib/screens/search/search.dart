import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details/controllers/student_controller.dart';
import '../view/view_screen.dart';

class SearchProfile extends SearchDelegate {
  // Rx<RxList<StudentModel>> temp = RxList<StudentModel>([]).obs;

  // RxList<StudentModel> temp.obs;
 final StudentController _controller = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder<StudentController>(
      builder: (controler) => ListView.separated(
        itemBuilder: (ctx, index) {
          final data = _controller.studentList[index];
          if (query == data.name.toLowerCase() ||
              query == data.name.toUpperCase()) {
            return ListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.to(
                    ViewScreen(
                      data: data,
                      index: index,
                    ),
                    transition: Transition.cupertino);
              },
              title: Text(
                data.name.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
        separatorBuilder: (context, value) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        },
        itemCount: _controller.studentList.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder<StudentController>(
      builder: (controler) => ListView.separated(
        itemBuilder: (ctx, index) {
          final data = _controller.studentList[index];
          if (data.name.toLowerCase().contains(query) ||
              data.name.toUpperCase().contains(query)) {
            return ListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.to(
                  ViewScreen(data: data, index: index),
                );
              },
              title: Text(
                data.name.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
        separatorBuilder: (context, value) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        },
        itemCount: _controller.studentList.length,
      ),
    );
  }
}
