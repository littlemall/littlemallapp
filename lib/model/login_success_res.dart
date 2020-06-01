import 'package:json_annotation/json_annotation.dart'; 
  
part 'login_success_res.g.dart';


@JsonSerializable()
  class login_success_res extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  login_success_res(this.code,this.msg,this.data,);

  factory login_success_res.fromJson(Map<String, dynamic> srcJson) => _$login_success_resFromJson(srcJson);

  Map<String, dynamic> toJson() => _$login_success_resToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'token')
  String token;

  Data(this.token,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
