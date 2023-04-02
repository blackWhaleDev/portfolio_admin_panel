import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseHttp {
  BaseHttp({this.withToken = true});

  final bool withToken;

  Future<http.Response> post(String urlSting,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final String? authorization = await getToken();
    final Uri url = Uri.parse(urlSting);

    return _sendRequest(http.post, url, headers, body, authorization);
  }

  Future<http.Response> get(String urlSting,
      {Map<String, String>? headers, Encoding? encoding}) async {
    final String? authorization = await getToken();
    final Uri url = Uri.parse(urlSting);

    return _sendRequest(http.get, url, headers, null, authorization);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return 'Bearer ${prefs.getString('token')}';
  }

  Future<http.Response> _sendRequest(
      Function method,
      Uri url,
      Map<String, String>? headers,
      Object? body,
      String? authorization) async {
    try {
      final response = await method(url, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "X-Requested-With": "XMLHttpRequest",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: authorization!,
      }, body: body);

      print("status code is:${response.statusCode.toString()} url is : $url response is ${response.body}");

      if (response.statusCode == 401) {
        final res = json.decode(utf8.decode(response.bodyBytes));
        if (res['message'] == 'Unauthenticated.') {
          print('Unauthenticated');
          // navigatorKey.currentState!.pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => AuthenticationScreen()),
          //         (Route<dynamic> route) => false);
        }
      }

      return response;
    } on Exception catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
}