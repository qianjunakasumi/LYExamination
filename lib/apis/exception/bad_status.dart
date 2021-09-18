import 'package:dio/dio.dart';
import 'package:lyexamination/apis/exception/api.dart';

class APIBadStatusException extends APIException implements Exception {
  APIBadStatusException(Response rsp) : super(rsp);
}
