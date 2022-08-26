// ignore_for_file: unused_field
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:student_details/db/models/data_model.dart';

class StudentController extends GetxController {
  final Box<StudentModel> _box = Hive.box('student_db');
  List<StudentModel> _studentList = [];
  _getStudent() {
    _studentList = _box.values.toList();
  }

  StudentController() {
    _getStudent();
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
    _box.delete(value);
    _getStudent();
    update();
  }
}
