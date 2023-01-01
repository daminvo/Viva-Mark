import 'package:flutter/material.dart';
import 'alertDialog.dart';

class Home extends StatefulWidget {
  static var routeName ='/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  decoration: InputDecoration(
                    labelText: "2nd student's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  //controller: c3_Controller,
                  decoration: InputDecoration(
                    labelText: "3rd student's full name ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
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
                  //controller: c3_Controller,
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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (_) => dialog(finalMark(supervisor_Controller.text,
                        examiner_Controller.text, president_Controller.text)
                    ));
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