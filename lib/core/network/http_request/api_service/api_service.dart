import 'package:bas_clean_architecture/core/local_data/pref_utils.dart';
import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/core/network/http_request/loggers/log_interceptor.dart';
import 'package:bas_clean_architecture/core/network/http_request/request_model/request_model.dart';
import 'package:bas_clean_architecture/core/network/http_request/request_model/request_status_code.dart';
import 'package:bas_clean_architecture/core/network/index.dart';
import 'package:bas_clean_architecture/features/login/data/data_cached_clients/login_data_cached.dart';
import 'package:bas_clean_architecture/features/login/presentation/bloc/login_cubit.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:bas_clean_architecture/core/env/app_env.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

typedef ApiResponseToModelParser<T> = T Function(Map<String, dynamic> json);

class ApiService with PreferencesUtil, LoadingMixin {
  var dio = Dio();

  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  void initialLizeNetworkSetting() async {
    interceptorInit();
  }

  String baseUrl = 'https://staging-api.freyatech.io/v1';

  void interceptorInit() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      await getToken();
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      logger.d(e);
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

  Future<Options> _baseOptions() async {
    await getToken();
    final deviceToken = await getDeviceToken();

    final accessToken =
        (await DataUserLoginCachedClient.instance.getData())?.token;
    //final accessToken = await getToken();
    logger.d('Access Token $accessToken');
    final headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': 'true',
      'Accept': 'application/json',
      'Authorization': accessToken,
      'DeviceToken': deviceToken,
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
    final url = '$baseUrl${request.route}';

    var response = await dio.get(
      url,
      options: await _baseOptions(),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPost(RequestModel request) async {
    final url = '$baseUrl${request.route}';
    var response = await dio.post(
      url,
      data: request.params,
      options: await _baseOptions(),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPut(RequestModel request) async {
    final url = '$baseUrl${request.route}';
    var response = await dio.put(
      url,
      data: request.params,
      options: await _baseOptions(),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> _requestDelete(RequestModel request) async {
    final url = '$baseUrl${request.route}';
    var response = await dio.delete(
      url,
      data: request.params,
      options: await _baseOptions(),
    );
    return response.data;
  }

  Future<void> getToken() async {
    final user = await DataUserLoginCachedClient.instance.getData();
    final loginCubit = LoginCubit();
    if (user?.token != null) {
      final accessToken =
          (await DataUserLoginCachedClient.instance.getData())?.token;
      if (accessToken != null && isTokenExpired(accessToken)) {
        loginCubit.refreshToken();
      }
    }
  }

  Future<String> getDeviceToken() async {
    return SharedPrefsHelper.getFcmToken();
  }

  bool isTokenExpired(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    int expirationTimestamp = decodedToken['exp'];

    int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (expirationTimestamp < currentTimestamp) {
      return true;
    }

    return false;
  }
}
