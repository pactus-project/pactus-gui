// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseModelImpl _$$ErrorResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$ErrorResponseModelImplToJson(
        _$ErrorResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
