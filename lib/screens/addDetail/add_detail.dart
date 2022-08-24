import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/Button/material_button.dart';
import '../../constants/styles.dart';
import '../../db/functions/db_functions.dart';
import '../../db/models/data_model.dart';
import '../home/home_screen.dart';
import 'dart:io';
import 'widgets/add_image.dart';
import 'widgets/textfields.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});
  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final formkey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _age = TextEditingController();

  final _domain = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final ImagePicker picker = ImagePicker();

  String _image = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                left: 30,
                width: 80,
                height: 200,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/light-1.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130,
                width: 80,
                height: 150,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/light-2.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                width: 80,
                height: 140,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/clock.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                child: Column(
                  children: [
                    const Text(
                      'Add Details',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image == null) {
                          return;
                        } else {
                          final imageTemporary =
                              File(image.path).readAsBytesSync();

                          setState(
                            () {
                              _image = base64Encode(imageTemporary);
                            },
                          );
                        }
                      },
                      child: AddImage(
                        image: _image,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()),
                    (route) => false),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFields(
                  name: 'Name',
                  controler: _username,
                  keybord: TextInputType.name,
                ),
                TextFields(
                  name: 'Mobile',
                  controler: _phone,
                  keybord: TextInputType.number,
                ),
                TextFields(
                  name: 'Domain',
                  controler: _domain,
                  keybord: TextInputType.name,
                ),
                TextFields(
                  name: 'Age',
                  controler: _age,
                  keybord: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Buttons(
            function: () {
              if (formkey.currentState!.validate()) {
                checkValidation();
              }
            },
            label: 'Submit'),
      ),
    );
  }

  checkValidation() {
    final name = _username.text.trim();
    final age = _age.text.trim();
    final domain = _domain.text.trim();
    final phone = _phone.text.trim();
    final student = StudentModel(
        age: age, name: name, domain: domain, phone: phone, image: _image);
    if (name.isEmpty ||
        age.isEmpty ||
        domain.isEmpty ||
        phone.isEmpty ||
        _image.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: themeColor,
          content: Text('All Field Required'),
        ),
      );
    } else {
      addStudent(student);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        ),
      );
    }
  }
}
