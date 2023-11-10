import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:movieverse/core/utils/widgets/custom_adaptive_dialog.dart';

class FireBaseFunctions {
  static Future<bool> registerAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          CustomAdaptiveDialog.customAdaptiveDialog(
              context: context,
              message: "The password provided is too weak.",
              title: 'Error');
        }
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        return false;
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          CustomAdaptiveDialog.customAdaptiveDialog(
              context: context,
              message: "The account already exists for that email.",
              title: 'Error');
        }

        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
    return false;
  }

  static Future<void> loginWithPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
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
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
