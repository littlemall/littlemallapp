import 'dart:io';
import 'dart:collection';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import 'package:littlemallapp/config/config.dart';

class Http {
  static Http instance;

  // static Map<String, String> baseHeaders = new HashMap();

  static Map<String, String> baseHeaders = {"token": "gh_88d2222abfba-1"};
  // static Map<String, String> baseHeaders = {};

  // final baseHeaders['Authorization'] = 'Token';

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static const BaseUrl = EnvConfig.BASEURL;
  static Http getInstance({BuildContext context}) {
    if (instance == null) {
      instance = new Http();
    }
    return instance;
  }

  getRequest(url, {Object params, noTip = false, BuildContext context}) async {
    Options option = new Options(method: "get");
    return await requestBase(url, baseHeaders, option,
        params: params, noTip: noTip, context: context);
  }

  postRequest(url, params, {noTip = false, BuildContext context}) async {
    Options option = new Options(method: "post");
    return await requestBase(url, baseHeaders, option,
        params: params, noTip: noTip, context: context);
  }

  putRequest(url, params, {noTip = false, BuildContext context}) async {
    Options option = new Options(method: "put");
    return await requestBase(url, baseHeaders, option,
        params: params, noTip: noTip, context: context);
  }

  deleteRequest(url, params, {noTip = false, BuildContext context}) async {
    Options option = new Options(method: "delete");
    return await requestBase(url, baseHeaders, option,
        params: params, noTip: noTip, context: context);
  }

  // static createRequest

  //具体的还是要看返回数据的基本结构
  //公共代码部分
  static requestBase(url, Map<String, String> header, Options option,
      {params, noTip = false, BuildContext context}) async {
    // 判断网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.none) {
      // showToast('请检查网络');
      return {'status_code': ConnectionState.none, "message": '网络错误'};
    }

    //处理请求头
    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    // session 逻辑
    // String session = SpUtil.getString(Constant.key_user_token);
    // if (session == null || session.length == 0) {
    // } else {
    //   headers['session'] = session;
    //   headers['Authorization'] = 'Token ' + session;
    // }
    //options处理
    if (option != null) {
      option.contentType = ContentType.parse(CONTENT_TYPE_JSON);
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }
    option.baseUrl = BaseUrl;
    option.connectTimeout = 15000;
    var dio = new Dio();
    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 3000;
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        // errorResponse.statusCode = ResultCode.NETWORK_TIMEOUT;
      }
      // debug模式才打印
      if (EnvConfig.DEBUG) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + option.headers.toString());
        print('请求参数: ' + params.toString());
        print('method: ' + option.method);
      }
      if (error.type == DioErrorType.RESPONSE) {
        print('网络错误');
      }
      return {'status_code': errorResponse.statusCode, "message": '网络错误'};
    }

    // debug模式打印相关数据
    if (EnvConfig.DEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    return response.data;
  }

  // String getUrl(String key) {
  //   String url;
  //   // if (OnlineOrMock[ONLINE].contains(key)) {
  //   //   url = Mock1BaseUrl + servicePath[key];
  //   // } else if (OnlineOrMock[API].contains(key)) {
  //   //   url = Mock2BaseUrl + servicePath[key];
  //   // } else {
  //   //   url = BaseUrl + servicePath[key];
  //   // }
  //   url = BaseUrl + servicePath[key];
  //   return url;
  // }
}
