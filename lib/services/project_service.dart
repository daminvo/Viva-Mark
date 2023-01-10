

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
  print("response.body");

  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
      Uri.parse(projectByKey),
      headers: { 'accept': 'application/json',},
      body: {
        "id": key
      }
    );

    print(response.body);

    switch(response.statusCode) {
      case 200:
        apiResponse.data = Project.fromJson(jsonDecode(response.body)[0]);
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
    }
  }
  catch(e) {
    print(e);
  }


  return apiResponse;
}

Future<ApiResponse> getUserProjects() async {
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
    final response = await http.get(
        Uri.parse(projectList),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
    );

    switch(response.statusCode){
      case 200:
        apiResponse.data =  jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = 'unauthorized';
        break;
    }
  }
  catch(e){
    print(e);
  }
  return apiResponse;
}



Future<ApiResponse> deleteviva(int id) async {
  ApiResponse apiResponse = ApiResponse();
  print("object");
  try{
    String token = await getToken();
    final response = await http.post(
        Uri.parse(deleteViva),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "id": '${id}'
        }
    );
  }
  catch(e){
    print(e);
  }
  return apiResponse;
}


Future<ApiResponse> sendmail(String key) async {
  ApiResponse apiResponse = ApiResponse();
  print("object");
  try{
    String token = await getToken();
    final response = await http.post(
        Uri.parse(SendMail),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "id": '${key}'
        }
    );
    print(response.body);
  }
  catch(e){
    print(e);  }
  return apiResponse;}





