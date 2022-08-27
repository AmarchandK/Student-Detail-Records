// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_details/db/models/data_model.dart';

class StudentController extends GetxController {
  final Box<StudentModel> _box = Hive.box('student_db');
  List<StudentModel> studentList = [];
  @override
  void onInit() {
    _getStudent();
    super.onInit();
  }

  _getStudent() {
    Hive.openBox('student_db');
    final Box<StudentModel> _box = Hive.box('student_db');
    studentList = _box.values.toList();
    update();
  }

  addStudent(StudentModel student) {
    final Box<StudentModel> _box = Hive.box('student_db');
    _box.add(student);
    _getStudent();
    update();
  }

  updateStudent(var key, StudentModel value) {
    Hive.openBox('student_db');

    final Box<StudentModel> _box = Hive.box('student_db');
    _box.put(key, value);
    _getStudent();
    update();
  }

  deleteStudent(StudentModel value) {
    value.delete();
    _getStudent();
    update();
  }
}
// class StudentController extends GetxController {
//   // final Box<StudentModel> _box = Hive.box('student_db');

//   List<StudentModel> studentList = [];
//   @override
//   void onInit() {
//     _getStudent();
//     super.onInit();
//   }

//   _getStudent() async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     studentList.addAll(studentDB.values);
//     update();
//   }

//   addStudent(StudentModel student) async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     final id = await studentDB.add(student);
//     student.id = id;
//     studentDB.putAt(student.id!, student);
//     //studentList.add(student);
//     _getStudent();
//     update();
//   }

//   updateStudent(index, data) async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     studentDB.putAt(index, data);
//     _getStudent();
//     update();
//   }

//   deleteStudent(index) async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     await studentDB.deleteAt(index);
//     _getStudent();
//     update();
//   }
// }