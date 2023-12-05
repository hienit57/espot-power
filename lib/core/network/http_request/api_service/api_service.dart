import 'dart:convert';

import 'package:espot_power/core/index.dart';
import 'package:espot_power/core/local_data/pref_utils.dart';
import 'package:espot_power/core/mixins/index.dart';
import 'package:espot_power/core/network/http_request/request_model/request_model.dart';
import 'package:espot_power/core/network/http_request/request_model/request_status_code.dart';
import 'package:espot_power/features/authentication/login/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

typedef ApiResponseToModelParser<T> = T Function(Map<String, dynamic> json);

class ApiService with PreferencesUtil, LoadingMixin, ToastMixin {
  var dio = Dio();

  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  void initialLizeNetworkSetting() async {
    interceptorInit();
  }

  String baseURL = '';

  void interceptorInit() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      final data = response.statusCode == 404;
      if (data) {
        showToast(
            message: response.data['message'],
            toastGravity: ToastGravity.BOTTOM,
            toastLenght: Toast.LENGTH_LONG);
      }
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      ///TODO:FIX ME
      //await refreshToken();
      return handler.next(e);
    }));

    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }

    //dio.interceptors.add(BaseBodyInterceptor(BaseBody().body));

    // Retry
    // dio.interceptors.add(RetryInterceptor(
    //   dio: dio,
    //   logPrint: print,
    //   retries: 3,
    //   retryDelays: const [
    //     Duration(seconds: 3),
    //     Duration(seconds: 3),
    //     Duration(seconds: 3),
    //   ],
    // ));
  }

  int getTimeZoneOffSet() {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    return yesterday.timeZoneOffset.inMinutes;
  }

  Future<Options> _baseOptions() async {
    final deviceToken = await getDeviceToken();

    ///TODO:FIX ACCESS TOKEN
    // final accessToken =
    //     (await DataUserLoginCachedClient.instance.getData())?.token;
    //final accessToken = await getToken();
    //logger.d('Access Token $accessToken');
    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': 'true',
      'Accept': 'application/json',
      'Authorization': '',
      'DeviceToken': deviceToken,
      'TimezoneOffset': getTimeZoneOffSet(),
    };
    Map<String, dynamic> extra = {};
    return Options(
      validateStatus: (status) => true,
      headers: headers,
      extra: extra,
      // sendTimeout: 3 * 1000, // 3s
      // receiveTimeout: 3 * 1000, //3s
    );
  }

  Future<Map<String, dynamic>> request(RequestModel request) async {
    if (request.requestType == RequestType.http) {
      switch (request.requestMethod) {
        case RequestMethod.get:
          return await _requestGet(request);
        case RequestMethod.post:
          return await _requestPost(request);
        case RequestMethod.put:
          return await _requestPut(request);
        case RequestMethod.delete:
          return await _requestDelete(request);
      }
    } else {
      return await _requestGraphql(request);
    }
  }

  Future<Map<String, dynamic>> _requestGraphql(RequestModel request) async {
    final url = '${AppEnviroment.instance.getApiUrl()}/graphql';

    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'accessToken',
    };
    final GraphQLClient client = GraphQLClient(
      link: HttpLink(
        url,
        defaultHeaders: header,
      ),
      cache: GraphQLCache(),
    );
    final QueryOptions options = QueryOptions(
      variables: request.grapqlVariables ?? {},
      document: gql(
        request.params ?? '',
      ),
    );
    showLoading();
    MyLogger().d('Header: $header');
    MyLogger().d('Requesting GraphQl: $url');
    MyLogger().d('Query: ${request.params}');
    final QueryResult result =
        await client.query(options).whenComplete(() => dismissloading());

    MyLogger().d('Response: ${result.data}');

    if (result.data != null) {
      return result.data!;
    } else {
      return BaseRequestResponse(status: RequestStatusCode.failure.value)
          .toJson();
    }
  }

  Future<Map<String, dynamic>> _requestGet(RequestModel request) async {
    final url = '${AppEnviroment.instance.getApiUrl()}${request.route}';

    var response = await dio.get(
      url,
      options: await _baseOptions(),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPost(RequestModel request) async {
    final url = '${AppEnviroment.instance.getApiUrl()}${request.route}';
    var response = await dio.post(
      url,
      data: request.params,
      options: await _baseOptions(),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPut(RequestModel request) async {
    final url = '${AppEnviroment.instance.getApiUrl()}${request.route}';
    var response = await dio.put(
      url,
      data: request.params,
      options: await _baseOptions(),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> _requestDelete(RequestModel request) async {
    final url = '${AppEnviroment.instance.getApiUrl()}${request.route}';
    var response = await dio.delete(
      url,
      data: request.params,
      options: await _baseOptions(),
    );
    return response.data;
  }

  // Future<void> refreshToken() async {
  //   try {
  //     final user = await DataUserLoginCachedClient.instance.getData();

  //     Map<String, dynamic> body = {
  //       "UserID": user?.data?.iD,
  //     };
  //     String jsonBody = json.encode(body);

  //     final res = await ApiService().request(RefreshTokenRequest(jsonBody));

  //     final response = LoginResponse.fromJson(res);

  //     // Assuming your LoginResponse has a token property, update the cached token
  //     if (response.token != null) {
  //       final user = await DataUserLoginCachedClient.instance.getData();
  //       //TODO:FIXME
  //       // user?.token = response.token;
  //       await DataUserLoginCachedClient.instance.storeData(user);
  //     }
  //   } catch (e) {
  //     // Handle any errors that might occur during the refresh process
  //     print("Error refreshing token: $e");
  //     // You might want to log the error, show a snackbar, or handle it in another way
  //   }
  // }

  Future<String> getDeviceToken() async {
    return SharedPrefsHelper.getFcmToken();
  }

  bool isTokenExpired(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    int expirationTimestamp = decodedToken['REFRESH_TOKEN'];

    int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (expirationTimestamp < currentTimestamp) {
      return true;
    }

    return false;
  }
}
