// ignore_for_file: unused_field, no_leading_underscores_for_local_identifier
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
    studentList = _box.values.toList();
    update();
  }

  addStudent(StudentModel student) {
    _box.add(student);
    _getStudent();
    update();
  }

  updateStudent(var key, StudentModel value) {
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
