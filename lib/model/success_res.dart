import 'package:json_annotation/json_annotation.dart'; 
  
part 'success_res.g.dart';


@JsonSerializable()
  class success_res extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  success_res(this.code,this.msg,this.data,);

  factory success_res.fromJson(Map<String, dynamic> srcJson) => _$success_resFromJson(srcJson);

  Map<String, dynamic> toJson() => _$success_resToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  Data();

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
