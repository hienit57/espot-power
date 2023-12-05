import 'package:bas_clean_architecture/core/local_data/pref_utils.dart';
import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication with ToastMixin, LoadingMixin, PreferencesUtil {
  static final FirebaseAuthentication instance =
      FirebaseAuthentication._internal();

  factory FirebaseAuthentication() {
    return instance;
  }

  FirebaseAuthentication._internal();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmail(
      {required String email, required String password}) async {
    showLoading();
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      dismissloading();
      final accessToken = await auth.currentUser?.getIdToken();
      logger.d('access token $accessToken');
      if (accessToken != null) {
        SharedPrefsHelper.saveAccessToken(accessToken);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      dismissloading();
      // showToast(
      //     message: e.message,
      //     toastLenght: Toast.LENGTH_SHORT,
      //     toastGravity: ToastGravity.TOP);
      //showAlertOptionsDialogErroLogin(context);
      return null;
    }
  }

  Future<void> resetPassword(BuildContext context,
      {String? email,
      Function(String?)? onFailed,
      Function()? onSuccess}) async {
    await auth.sendPasswordResetEmail(email: email ?? '').then((value) {
      onSuccess?.call();
    }).onError((error, stackTrace) {
      onFailed?.call(error.toString());
    });
    dismissloading();
  }

  Future<String> updatePassword({
    String? newPassword,
  }) async {
    showLoading();

    try {
      await auth.currentUser
          ?.updatePassword(newPassword ?? '')
          .then((value) => null);

      dismissloading();
      return 'success';
    } catch (e) {
      dismissloading();
      // showToast(
      //     message: e.toString(),
      //     toastLenght: Toast.LENGTH_SHORT,
      //     toastGravity: ToastGravity.TOP);
      return 'failed';
    }
  }

  bool isEmailVerified() {
    if (auth.currentUser != null) {
      User user = auth.currentUser!;
      return user.emailVerified;
    }
    return false;
  }

  void reloadDataUser() async {
    User user = auth.currentUser!;
    user.reload();
  }

  Future<String> uploadFile(PlatformFile file) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${file.name}');
    if (file.bytes == null) return '';
    UploadTask uploadTask = storageReference.putData(
      file.bytes!,
    );
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
