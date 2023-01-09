import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/ApiResponse.dart';
import 'package:shop_app/models/Project.dart';
import 'package:shop_app/services/user_service.dart';
import '../../../services/project_service.dart';
import 'alertDialog.dart';

class Home extends StatefulWidget {
  static var routeName ='/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name;
  String? supervisor;
  String? examiner;
  String? president;
  String? firstStudent;
  String? secondStudent;
  String? thirdStudent;
  String? vivaMark;
  final year = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final supervisor_Controller = TextEditingController();
  final examiner_Controller = TextEditingController();
  final president_Controller = TextEditingController();

  finalMark(a, b, c) {
    return (double.parse(a) * 0.3 +
        double.parse(b) * 0.3 +
        double.parse(c) * 0.4).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                TextFormField(
                    onSaved: (value) => name = value,
                    onChanged: (value) { name = value; },
                    decoration: InputDecoration(
                      labelText: "Project name ",
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                    }),
                SizedBox(height: height * 0.04),
                TextFormField(
                    controller: year,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: " Year ",
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                    }),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onSaved: (newValue) => firstStudent = newValue,
                  onChanged: (value) { firstStudent = value; },
                  decoration: InputDecoration(
                    labelText: "1st student's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onSaved: (newValue) => secondStudent = newValue,
                  onChanged: (value) { secondStudent = value; },
                  decoration: InputDecoration(
                    labelText: "2nd student's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onSaved: (newValue) => thirdStudent = newValue,
                  onChanged: (value) { thirdStudent = value; },
                  decoration: InputDecoration(
                    labelText: "3rd student's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onChanged: (value) { supervisor = value; },
                  onSaved: (newValue) => supervisor = newValue,
                  decoration: InputDecoration(
                    labelText: "supervisor's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onChanged: (value) { examiner = value; },
                  onSaved: (newValue) => examiner = newValue,
                  decoration: InputDecoration(
                    labelText: "examiner's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  onChanged: (value) { president = value; },
                  onSaved: (newValue) => president = newValue,
                  decoration: InputDecoration(
                    labelText: "president's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: supervisor_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "final mark of the supervisor ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    } else if (double.parse(value) > 12) {
                      return 'this value must be less than or equal to 12';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: examiner_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "final mark of the examiner",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    } else if (double.parse(value) > 12) {
                      return 'this value must be less than or equal to 12';
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: president_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "final mark of the president ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    } else if (double.parse(value) > 12) {
                      return 'this value must be less than or equal to 12';
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          ElevatedButton(
            onPressed: () async {
              vivaMark = finalMark(supervisor_Controller.text, examiner_Controller.text, president_Controller.text);
              if (formKey.currentState!.validate()) {
                await showDialog(
                    context: context,
                    builder: (_) => dialog(vivaMark
                    ));
                Project newProject = Project(
                  name: name,
                  supervisor: supervisor,
                  examiner: examiner,
                  president: president,
                  firstStudent: firstStudent,
                  secondStudent: secondStudent,
                  thirdStudent: thirdStudent,
                  year: int.parse(year.text),
                  spMark: int.parse(supervisor_Controller.text),
                  exMark: int.parse(examiner_Controller.text),
                  prMark: int.parse(president_Controller.text),
                  vivaMark: double.parse(vivaMark!),
                  userId: await getUserId(),
                );
                ApiResponse response = await createNewProject(newProject);
                if(response.data != null){
                  dialog(Text('done'));
                }
              }
            },
            child: Text(
              'submit',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue[700],
                fixedSize: const Size(180, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
    );
  }
}