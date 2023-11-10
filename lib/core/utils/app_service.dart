import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:movieverse/core/utils/hive/hive_user_data.dart';

class AppService extends ChangeNotifier {
  /// Ensure to make this as a singleton class.
  AppService._();

  factory AppService() => _instance;

  static AppService get instance => _instance;
  static final AppService _instance = AppService._();

  final Box storageBox = Hive.box('App Service Box');

  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  final _kCurrentUserKey = 'current_user';

  UserData? currentUser;

  bool get isLoggedIn => currentUser != null;

  void initialize() {
    final user = storageBox.get(_kCurrentUserKey);
    if (user != null) currentUser = user;
  }

  void setUserData(UserData userData) {
    storageBox.put(_kCurrentUserKey, userData);
    currentUser = userData;
    notifyListeners();
  }

  void manageAutoLogout() {
    terminate();
    context.go("/");
  }

  Future<void> terminate() async {
    currentUser = null;
    storageBox.clear();
  }
}
