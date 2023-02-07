import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_socket/presentation/chat_screen.dart';
import 'package:flutter_socket/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<NavigatorState> navigatoryKey = new GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      // redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: HomeScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [BotToastNavigatorObserver()],
      navigatorKey: navigatoryKey);
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier(this.ref);

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    // final token = _ref.watch(loggedInProvider).token;
    // final user = _ref.watch(loggedInProvider).user;

    // Logger.i('RouterNotifier: $user = $token');

    // bool loggedIn = _ref.watch(loggedInProvider).loggedIn;

    // final bool loggingIn = state.subloc == LoginScreen.routeName;

    // if (!loggedIn) {
    //   return LoginScreen.routeName;
    // }
    // if (loggingIn) {
    //   return MainNav.routeName;
    // }

    // final areWeLoggingIn = state.location == LoginScreen.routeName;
    // final areWeRegistering = state.location == SignupScreen.routeName;

    // if (!isUserIn() && areWeLoggingIn) {
    //   return areWeLoggingIn ? null : LoginScreen.routeName;
    // }
    // if (!isUserIn() && areWeRegistering) {
    //   return areWeRegistering ? null : SignupScreen.routeName;
    // }

    // if (areWeLoggingIn || areWeRegistering) return MainNav.routeName;

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: ChatScreen.route,
          builder: (context, state) => const ChatScreen(),
        ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}
