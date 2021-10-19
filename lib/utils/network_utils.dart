import 'package:dio/dio.dart';
import 'package:tech_alchemy/constants/const_strings.dart';

Future<Options> getDioOptions() async {
  return Options(headers: {
    'Authorization': 'Bearer $bearerToken',
  });
}
