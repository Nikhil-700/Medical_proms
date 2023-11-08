import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final _client = Dio(BaseOptions(
    baseUrl: "http://127.0.0.1:5000/api",
  ));

  Future<Response<dynamic>> fetchQuestionairre() async {
    final response = await _client.get("/data");
    return response;
  }

  Future<Response<dynamic>> sendPrompt(
    // String userID,
    List<dynamic> selectedOptions,
  ) async {
    var data = {"response": selectedOptions};
    final response = await _client.post("/save",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(data));
    return response;
  }
}
