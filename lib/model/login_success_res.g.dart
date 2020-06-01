// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_success_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

login_success_res _$login_success_resFromJson(Map<String, dynamic> json) {
  return login_success_res(
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$login_success_resToJson(login_success_res instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['token'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
    };
