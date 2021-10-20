import 'package:dio/dio.dart';
import 'package:lyexamination/data/apis/exception/api.dart';

class APIBadStatusException extends APIException implements Exception {
  const APIBadStatusException(Response rsp) : super(rsp);
}
