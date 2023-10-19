import 'package:dio/dio.dart';
import 'package:news/data/network_service/network_service.dart';

Future<Response?> get( 
  String path, {
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onReceiveProgress,
  bool ignoreToken = false,
}) async {
  options?.headers ??= {};
  options?.headers!["Timezone"] = DateTime.now().timeZoneName;
  Response response = await NetworkService.instance.dio.get(path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress);
  return response;
}
