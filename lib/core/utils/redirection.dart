part of 'app_router.dart';

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLoggedIn;
  final isLoginRoute = state.matchedLocation == "/loginScreen";

  if(state.matchedLocation=="/")
    {
      return '/';
    }

  if (!isLoggedIn&& state.matchedLocation == "/registerScreen") {
    return "/registerScreen";
  }
  else if (!isLoggedIn && !isLoginRoute) {
    return "/loginScreen";
  } else if (isLoggedIn && isLoginRoute) {
    return "/mainScreen";
  }

  return null;
}
