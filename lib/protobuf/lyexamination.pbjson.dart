///
//  Generated code. Do not modify.
//  source: ProtoBuf/lyexamination.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginReqDescriptor instead')
const LoginReq$json = const {
  '1': 'LoginReq',
  '2': const [
    const {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'pwd', '3': 2, '4': 1, '5': 9, '10': 'pwd'},
  ],
};

/// Descriptor for `LoginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReqDescriptor = $convert.base64Decode('CghMb2dpblJlcRIUCgVwaG9uZRgBIAEoCVIFcGhvbmUSEAoDcHdkGAIgASgJUgNwd2Q=');
@$core.Deprecated('Use loginRspDescriptor instead')
const LoginRsp$json = const {
  '1': 'LoginRsp',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `LoginRsp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRspDescriptor = $convert.base64Decode('CghMb2dpblJzcBIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9u');
