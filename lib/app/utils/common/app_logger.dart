// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class AppLogger {
  safeLog(Object message) {
    if (kDebugMode) {
      return Logger().d(message);
    } else {
      return null;
    }
  }

  String getMetadataMessages(String jsonData) {
    String messages = "";
    if (jsonData.isNotEmpty) {
      messages = json.decode(jsonData)["metadata"]["messages"];
    } else {
      messages = "gagal ambil data!";
    }
    return messages;
  }

  responseLog(Object uri, Response response) {
    if (kDebugMode) {
      appLog.w("URI ====> $uri");
      appLog.v("Status Code ====> ${response.statusCode}");
      appLog.d("response ===> ");
      appLog.i(json.decode(response.body));
    }
  }
}

AppLogger logger = new AppLogger();
Logger appLog = new Logger();
