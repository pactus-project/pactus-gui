import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;

class SafeGrpcCall {
  static Future<Either<Failure, T>> call<T>(
    Future<T> Function() requestFn,
  ) async {
    try {
      final response = await requestFn();
      return Right(response);
    } on GrpcError catch (e) {
      return Left(Failure(_mapGrpcError(e)));
    } on SocketException {
      return Left(Failure(LocaleKeys.error_no_internet));
    } on TimeoutException {
      return Left(Failure(LocaleKeys.error_timeout));
    } on Exception catch (_) {
      return Left(Failure(LocaleKeys.error_unexpected));
    }
  }

  static String _mapGrpcError(GrpcError error) {
    switch (error.code) {
      case StatusCode.cancelled:
        return LocaleKeys.error_grpc_cancelled;
      case StatusCode.unauthenticated:
        return LocaleKeys.error_grpc_unauthenticated;
      case StatusCode.permissionDenied:
        return LocaleKeys.error_grpc_permission_denied;
      case StatusCode.unavailable:
        return LocaleKeys.error_grpc_unavailable;
      case StatusCode.deadlineExceeded:
        return LocaleKeys.error_grpc_deadline_exceeded;
      default:
        return error.message ?? LocaleKeys.error_grpc_unknown;
    }
  }
}
