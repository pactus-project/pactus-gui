import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response_model.freezed.dart';
part 'error_response_model.g.dart';

@freezed
class ErrorResponseModel with _$ErrorResponseModel {
  const factory ErrorResponseModel({int? status, String? msg}) =
      _ErrorResponseModel;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
}
