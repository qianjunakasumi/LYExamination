import 'package:dio/dio.dart';
import 'package:lyexamination/apis/exception/api.dart';

class APIBadRespondException extends APIException implements Exception {
  final String message;
  final String testament;

  final bool panic;

  const APIBadRespondException(Response rsp, this.message,
      {this.panic = false, this.testament = ''})
      : super(rsp);
}
