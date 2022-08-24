// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:student_details/screens/addDetail/add_detail.dart';
import '../../constants/Button/material_button.dart';
import '../../constants/styles.dart';
import '../../db/functions/db_functions.dart';
import '../search/search.dart';
import 'student_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: Container(
        decoration: baground,
        child: Scaffold(
          backgroundColor: Colors.transparent,
       
          appBar: AppBar(
            title: titile(tittle: 'STUDENTS'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchProfile(),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: const StudentList(),
          bottomNavigationBar:  Buttons(
            label: 'ADD NEW',
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddDetails(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
