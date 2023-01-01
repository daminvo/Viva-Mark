import 'package:flutter/material.dart';

class dialog extends StatelessWidget {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  final finalMark;
  dialog(this.finalMark);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(finalMark.replaceAll(regex, '')+'/12',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      title: Text('Final Mark',style: TextStyle(fontSize: 30.0),textAlign: TextAlign.center,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text('Ok',style: TextStyle(fontSize:25.0),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

