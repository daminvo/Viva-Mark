import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/ApiResponse.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

// userLogin
Future<ApiResponse> userLogin (String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
      Uri.parse(login),
      headers: {'accept': 'application/json'},
      body: { 'email': email, 'password': password}
    );

    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 422:
        final error = jsonDecode(response.body)['errors'];
        apiResponse.error = error[error.keys.elementAt(0)][0];
        break;
    }
  }
  catch(e){

  }

  return apiResponse;
}

// userRegister
Future<ApiResponse> userRegister (String? email, String? firstName, String? familyName, String? password) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(register),
        headers: {'accept': 'application/json'},
        body: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'familyName': familyName,

        }

    );
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        String? tokeen = User.fromJson(jsonDecode(response.body)).token;
        break;
      case 422:
        final error = jsonDecode(response.body)['errors'];
        apiResponse.error = error[error.keys.elementAt(0)][0];
        break;
    }

  }
  catch(e){
  }
  return apiResponse;
}

// userGoogleSign
Future<ApiResponse> userGoogleSign (String? email, String? firstName, String? familyName) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(googleSign),
        headers: {'accept': 'application/json'},
        body: {
          'email': email,
          'firstName': firstName,
          'familyName': familyName,
          'password': ''
        }
    );


    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final error = jsonDecode(response.body)['errors'];
        apiResponse.error = error[error.keys.elementAt(0)][0];
        break;
    }
  }
  catch(e){
  }

  return apiResponse;
}


// getUserInfo
Future<ApiResponse> getUserInfo() async {
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
    final response = await http.post(
        Uri.parse(userInfo),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {}
    );

    switch(response.statusCode){
      case 200:
        apiResponse.data = User.infoFromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = 'unauthorized';
        break;
    }
  }
  catch(e){
  }
  return apiResponse;
}

// getToken
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// getUserId
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// userLogout
Future<bool> userLogout() async {

  String token = await getToken();
  final response = await http.post(
      Uri.parse(logout),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {}
  );

  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.remove('token');
}


