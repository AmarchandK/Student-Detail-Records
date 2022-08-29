import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/Button/material_button.dart';
import '../../constants/styles.dart';
import '../../controllers/student_controller.dart';
import '../../db/models/data_model.dart';
import '../home/home_screen.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {
  StudentModel data;
  late RxString image = data.image.obs;
  int? index;
  EditPage({Key? key, required this.data, required this.index})
      : super(key: key);

  final StudentController _controller = Get.put(StudentController());
  final formkey = GlobalKey<FormState>();

  final _name = TextEditingController();

  final _age = TextEditingController();

  final _domain = TextEditingController();

  final _phone = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    _name.text = data.name.toString();
    _age.text = data.age.toString();
    _domain.text = data.domain.toString();
    _phone.text = data.phone.toString();
    return Container(
      decoration: baground,
      child: Scaffold(
        appBar: AppBar(
          title: titile(tittle: 'EDIT DETAILS'),
        ),
        body: Form(
            child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    final images = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (images == null) {
                      return;
                    } else {
                      final imageTemporary =
                          File(images.path).readAsBytesSync();

                      image.value = base64Encode(imageTemporary);
                    }
                  },
                  child: Obx(
                    () => CircleAvatar(
                      backgroundImage: MemoryImage(
                          const Base64Decoder().convert(image.value)),
                      radius: 50,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invald Username';
                  } else {
                    return null;
                  }
                },
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid age';
                  } else {
                    return null;
                  }
                },
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid domain';
                  } else {
                    return null;
                  }
                },
                controller: _domain,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Domain'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid Phone';
                  } else {
                    return null;
                  }
                },
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Buttons(
              function: () {
                checkValidation(data);
                formkey.currentState?.validate();
              },
              label: 'UPDATE'),
        ),
      ),
    );
  }

  checkValidation(StudentModel data) async {
    final name = _name.text.trim();
    final age = _age.text.trim();
    final domain = _domain.text.trim();
    final phone = _phone.text.trim();
    final student = StudentModel(
        age: age, name: name, domain: domain, phone: phone, image: image.value);

    if (name.isEmpty || age.isEmpty || domain.isEmpty || phone.isEmpty) {
      return;
    } else {
      _controller.updateStudent(data.key, student);
      Get.offAll(
        const HomeScreen(),
      );
    }
  }
}
