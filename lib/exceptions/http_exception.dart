import 'package:flutter/widgets.dart';

class HttpException implements Exception {
  final String msg;
  final int statusCode;

  HttpException({
    required this.statusCode,
    required this.msg,
  });

  @override
  String toString() {
    return msg;
  }
}
