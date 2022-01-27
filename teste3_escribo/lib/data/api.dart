import 'package:dio/dio.dart';

// configs para validar chave de instalacao e buscar lista de servidores
const kBaseUrl = 'https://swapi.dev/api';

// final kDioOptionsTokenServidores = BaseOptions(
//   baseUrl: kBaseUrlServidores,
//   connectTimeout: 5000,
//   receiveTimeout: 3000,
//   contentType: 'application/x-www-form-urlencoded',
// );

// final kDioOptionsServidores = BaseOptions(
//   baseUrl: kBaseUrlServidores,
//   connectTimeout: 5000,
//   receiveTimeout: 3000,
//   contentType: 'application/json;charset=utf-8',
// );

// // configs login no servidor e demais chamadas na api
var kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/x-www-form-urlencoded',
);

// final kDioOptions = BaseOptions(
//   baseUrl: '',
//   connectTimeout: 5000,
//   receiveTimeout: 3000,
//   contentType: 'application/json;charset=utf-8',
// );

