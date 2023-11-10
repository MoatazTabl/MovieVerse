import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movieverse/core/utils/app_service.dart';
import 'package:movieverse/core/utils/hive/hive_user_data.dart';
import 'package:movieverse/core/utils/widgets/custom_adaptive_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> signInWithPass(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginRequested());

    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim(),
      );

      AppService.instance.setUserData(
        UserData(
          id: user.credential?.accessToken,
          email: email,
          profilePic: null,
        ),
      );

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure());

      if (kDebugMode) {
        print(e);
      }
      if (e.code == 'user-not-found') {
        if (context.mounted) {
          CustomAdaptiveDialog.customAdaptiveDialog(
              context: context,
              message: "No user found for that email.",
              title: 'Error');
        }
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (context.mounted) {
          CustomAdaptiveDialog.customAdaptiveDialog(
              context: context,
              message: "Wrong password provided for that user.",
              title: 'Error');
        }

        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      } else if (e.code == 'invalid-email') {
        if (context.mounted) {
          CustomAdaptiveDialog.customAdaptiveDialog(
              context: context, message: "Wrong Email", title: 'Error');
        }
        if (kDebugMode) {
          print('Wrong Email');
        } else {
          if (context.mounted) {
            CustomAdaptiveDialog.customAdaptiveDialog(
                context: context, message: "Check Input", title: 'Error');
          }
        }
      }
    } catch (e) {
      emit(LoginFailure());

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      final userData = user.additionalUserInfo;

      AppService.instance.setUserData(
        UserData(
          id: userData?.profile?["id"],
          email: userData?.profile?["email"],
          profilePic: userData?.profile?["picture"],
        ),
      );

      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> googleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();
  }

}
