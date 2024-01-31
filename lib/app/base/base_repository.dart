import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:seru_mob_app/app/configs/app_const.dart';

class BaseRepository {
  final String _errorMsgHandler = "Failed to load, please try again";

  mapToData(String event) {
    try {
      return jsonDecode(event);
    } catch (e) {
      if (AppConst.isDebuggable) {
        throw Exception(e);
      } else {
        throw Exception(_errorMsgHandler);
      }
    }
  }

  mapToJson(Response<String> event) {
    try {
      return jsonDecode(event.data!);
    } catch (e) {
      if (AppConst.isDebuggable) {
        throw Exception(e);
      } else {
        throw Exception(_errorMsgHandler);
      }
    }
  }
}
