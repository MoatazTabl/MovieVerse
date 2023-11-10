import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {


  final String _baseUrl = "https://api.themoviedb.org/3/";

  final Map<String, dynamic>headers = {
    "accept": "application/json",
    "Authorization": dotenv.env["API_KEY"],
  };

  final Dio _dio=Dio();



  Future<Map<String, dynamic>> get({required String endpoint}) async
  {
    var response = await _dio.get(
        "$_baseUrl$endpoint", options: Options(headers:headers));
    return response.data;
  }

}