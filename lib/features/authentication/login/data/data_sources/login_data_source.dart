import 'dart:convert';

import 'package:espot_power/core/network/index.dart';
import 'package:espot_power/features/index.dart';

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
