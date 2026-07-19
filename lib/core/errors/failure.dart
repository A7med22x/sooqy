import 'package:dio/dio.dart';

class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  factory ServerFailure.fromError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
          return const ServerFailure(
            message: 'Connection timeout. Please try again later.',
          );

        case DioExceptionType.receiveTimeout:
          return const ServerFailure(
            message: 'Server response timeout. Please try again later.',
          );

        case DioExceptionType.badCertificate:
          return const ServerFailure(
            message: 'Invalid security certificate.',
          );

        case DioExceptionType.badResponse:
          if (error.response != null) {
            return ServerFailure._fromBadResponse(error.response!);
          }
          return const ServerFailure(
            message: 'Unexpected server response.',
          );

        case DioExceptionType.cancel:
          return const ServerFailure(
            message: 'Request was cancelled.',
          );

        case DioExceptionType.connectionError:
          return const ServerFailure(
            message: 'No internet connection.',
          );

        case DioExceptionType.unknown:
          return const ServerFailure(
            message: 'Something went wrong. Please try again.',
          );
        case DioExceptionType.transformTimeout:
          throw UnimplementedError();
      }
    }

    return const ServerFailure(
      message: 'Something went wrong. Please try again.',
    );
  }

  factory ServerFailure._fromBadResponse(Response response) {
    final statusCode = response.statusCode;

    // Try to extract message from API response
    String? apiMessage;

    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;

      // Case 1: { "message": "Error message" }
      if (data['message'] is String) {
        apiMessage = data['message'];
      }

      // Case 2: { "errors": { "field": ["message"] } }
      else if (data['errors'] is Map) {
        final errors = data['errors'] as Map;

        if (errors.isNotEmpty) {
          final firstError = errors.values.first;

          if (firstError is List && firstError.isNotEmpty) {
            apiMessage = firstError.first.toString();
          }
        }
      }
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(
          message: apiMessage ?? 'Bad request.',
        );

      case 401:
        return const ServerFailure(
          message: 'Unauthorized.',
        );

      case 403:
        return ServerFailure(
          message: apiMessage ?? 'Access denied.',
        );

      case 404:
        return const ServerFailure(
          message: 'Resource not found.',
        );

      case 429:
        return const ServerFailure(
          message: 'Too many requests. Please try again later.',
        );

      case 500:
      case 502:
      case 503:
        return const ServerFailure(
          message: 'Server error. Please try again later.',
        );

      default:
        return ServerFailure(
          message: apiMessage ?? 'An unexpected error occurred.',
        );
    }
  }
}