import 'dart:convert';

import 'package:bas_clean_architecture/core/network/index.dart';
import 'package:bas_clean_architecture/features/login/data/data_cached_clients/login_data_cached.dart';
import 'package:bas_clean_architecture/features/login/data/models/login_response_model.dart';
import 'package:bas_clean_architecture/features/login/data/requests/login_request.dart';
import 'package:bas_clean_architecture/features/login/data/requests/refresh_token_request.dart';

class LoginDataSource {
  Future<LoginResponse?> login(
      {required String email, required String password}) async {
    Map<String, dynamic> body = {"Email": email, "Password": password};
    String jsonBody = json.encode(body);
    final res = await ApiService().request(LoginRequest(jsonBody));

    final response = LoginResponse.fromJson(res);

    return response;
  }

  Future<LoginResponse?> refreshToken({int? userId}) async {
    Map<String, dynamic> body = {
      "UserID": userId,
    };
    String jsonBody = json.encode(body);
    final res = await ApiService().request(RefreshTokenRequest(jsonBody));

    final response = LoginResponse.fromJson(res);

    return response;
  }
}

// Future<void> signInWithCustomToken(String customToken) async {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   try {
//     await auth.signInWithCustomToken(customToken);

//     User? currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser != null) {
//       final accessToken = await currentUser.getIdToken();
//       await SharedPrefsHelper.saveAccessToken(accessToken);
//     }
//   } catch (e) {
//     MyLogger().d(e.toString());
//   }
//   return;
// }
