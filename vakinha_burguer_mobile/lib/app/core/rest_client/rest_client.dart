import 'package:get/get.dart';

class RestClient extends GetConnect {
  final String _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  //Constructor
  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  //Constructor
  RestClientException({this.code, required this.message});

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
