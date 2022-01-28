import 'package:dio/dio.dart';

const kBaseUrl = 'https://swapi.dev/api';

var kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  // connectTimeout: 5000,
  // receiveTimeout: 3000,
  contentType: 'application/x-www-form-urlencoded',
);
