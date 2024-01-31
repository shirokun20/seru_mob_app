import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:seru_mob_app/app/utils/storage_util.dart';

class NetworkUtil {
  static Dio dioClient() {
    StorageUtil storage = Get.find();
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(seconds: 40),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
          responseBody: true, requestBody: true, requestHeader: true),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handle) async {
          final token = await storage.getToken();
          if (token != null) {
            option.headers["Authorization"] = "Bearer $token";
          }
          return handle.next(option);
        },
      ),
    );
    return dio;
  }
}
