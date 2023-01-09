

import 'dart:convert';

import 'package:shop_app/services/user_service.dart';

import '../constants.dart';
import '../models/ApiResponse.dart';
import 'package:http/http.dart' as http;

import '../models/Project.dart';

// create a new project
Future<ApiResponse> createNewProject (Project proj) async {
  print('userProject${proj.userId}');
  ApiResponse apiResponse = ApiResponse();
  try{
    final jsonMsg = jsonEncode({
      'name': proj.name,
      'supervisor': proj.supervisor,
      'examiner': proj.examiner,
      'president': proj.president,
      'firstStudent': proj.firstStudent,
      'secondStudent': proj.secondStudent,
      'thirdStudent': proj.thirdStudent,
      'spMark': proj.spMark,
      'exMark': proj.exMark,
      'prMark': proj.prMark,
      'vivaMark': proj.vivaMark,
      'year': proj.year,
      'userId': proj.userId,
    });
    final response = await http.post(
      Uri.parse(createProject),
        headers: {'Content-Type': 'application/json'},
      body: jsonMsg,
    );

    print(response.body);

    switch(response.statusCode){
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
    }
  }
  catch(e){
  }
  return apiResponse;
}

// get a project by its key
Future<ApiResponse> getProjectByKey( String? key) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
      Uri.parse(projectByKey),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(key)
    );

    switch(response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
    }
  }
  catch(e) {
  }


  return apiResponse;
}

