import 'package:dio/dio.dart';

class APIException implements Exception {
  final Response rsp;

  APIException(this.rsp);
}
