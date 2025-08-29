import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;

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
      return Left(Failure("No internet connection or server unreachable"));
    } on TimeoutException {
      return Left(Failure("Request timed out, please try again"));
    } catch (e) {
      return Left(Failure("Unexpected error: ${e.toString()}"));
    }
  }

  static String _mapGrpcError(GrpcError error) {
    switch (error.code) {
      case StatusCode.cancelled:
        return "Request was cancelled";
      case StatusCode.unauthenticated:
        return "You are not authenticated";
      case StatusCode.permissionDenied:
        return "Permission denied";
      case StatusCode.unavailable:
        return "Service temporarily unavailable";
      case StatusCode.deadlineExceeded:
        return "Server took too long to respond";
      default:
        return error.message ?? "Unknown gRPC error";
    }
  }
}
