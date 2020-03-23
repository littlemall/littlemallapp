// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

success_res _$success_resFromJson(Map<String, dynamic> json) {
  return success_res(
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$success_resToJson(success_res instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data();
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};
