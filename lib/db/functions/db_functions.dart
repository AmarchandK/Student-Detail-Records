// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

void addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);  
  value.id = id;
  studentDB.putAt(value.id!, value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}
getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}
deleteStudent(int index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(index);
  await getAllStudents();
}
updateDetails({required data, required index}) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(index, data);
  getAllStudents();
}
