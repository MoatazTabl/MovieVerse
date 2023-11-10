import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errorMessage);

  factory ServerFailures.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures("Connection Timeout with server");
      case DioExceptionType.sendTimeout:
        return ServerFailures("Request took too long");
      case DioExceptionType.receiveTimeout:
        return ServerFailures("Request took too long");
      case DioExceptionType.badCertificate:
        return ServerFailures("Connection Timeout with server");
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(dioException.response?.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures("Request to server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailures("Connection Error");
      case DioExceptionType.unknown:
        if(dioException.message!.contains("SocketException")){
          return ServerFailures("No Internet Connection");
        }
        return ServerFailures("Unexpected Error");
    }
  }

  factory ServerFailures.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response["status_message"]);
    } else if (statusCode == 404) {
      return ServerFailures("Your request not Found,Please try again later");
    } else if (statusCode == 500) {
      return ServerFailures("Internal Server Error,Please try again later");
    } else {
      return ServerFailures("Oops There was an error");
    }
  }
}
