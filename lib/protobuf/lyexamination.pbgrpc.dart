///
//  Generated code. Do not modify.
//  source: ProtoBuf/lyexamination.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'lyexamination.pb.dart' as $0;
export 'lyexamination.pb.dart';

class LYExaminationClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginReq, $0.LoginRsp>(
      '/LYExamination/Login',
      ($0.LoginReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginRsp.fromBuffer(value));

  LYExaminationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginRsp> login($0.LoginReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

abstract class LYExaminationServiceBase extends $grpc.Service {
  $core.String get $name => 'LYExamination';

  LYExaminationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginReq, $0.LoginRsp>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginReq.fromBuffer(value),
        ($0.LoginRsp value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginRsp> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginReq> request) async {
    return login(call, await request);
  }

  $async.Future<$0.LoginRsp> login($grpc.ServiceCall call, $0.LoginReq request);
}
