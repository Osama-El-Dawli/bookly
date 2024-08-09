import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  const Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate timeout with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioerror.response!.statusCode as int, dioerror.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with api server');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected Error');
      default:
        return ServerFailure('Oops There was an Error, Please try later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return response['error']['message'];
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server erorr');
    } else {
      return ServerFailure('Oops There was an Error, Please try later');
    }
  }
}
