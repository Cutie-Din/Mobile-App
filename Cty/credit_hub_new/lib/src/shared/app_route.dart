import 'package:credit_hub_new/src/ui/main/add/add_screen.dart';
import 'package:credit_hub_new/src/ui/main/menu/bottom_menu.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

enum AppRoute {
  splash,
  signIn,
  forgotPassword,
  changePassword,
  otp,
  main,
  dashboard,
  history,
  add,
  notification,
  account
}

extension AppRouteExt on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.splash:
        return '/splash';
      case AppRoute.signIn:
        return '/sign_in';
      case AppRoute.forgotPassword:
        return '/forgot_password';
      case AppRoute.otp:
        return '/otp';
      case AppRoute.changePassword:
        return '/change_password';
      case AppRoute.main:
        return '/main';
      case AppRoute.dashboard:
        return '/dashboard';
      case AppRoute.history:
        return '/history';
      case AppRoute.add:
        return '/add';
      case AppRoute.notification:
        return '/change_password';
      case AppRoute.account:
        return '/account';
      default:
        return '';
    }
  }

  static AppRoute? from(String? name) {
    for (final item in AppRoute.values) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (AppRouteExt.from(settings.name)) {
      case AppRoute.splash:
        return GetPageRoute(
          settings: settings,
          page: () => const SplashScreen(),
        );
      case AppRoute.signIn:
        return GetPageRoute(
          settings: settings,
          page: () => const SignInScreen(),
          bindings: [],
        );
      case AppRoute.forgotPassword:
        return GetPageRoute(
          settings: settings,
          page: () => const ForgetPasswordScreen(),
          bindings: [],
        );
      case AppRoute.otp:
        return GetPageRoute(
          settings: settings,
          page: () => const OtpScreen(),
          bindings: [],
        );
      case AppRoute.changePassword:
        return GetPageRoute(
          settings: settings,
          page: () => const ChangePasswordScreen(),
          bindings: [],
        );

      case AppRoute.main:
        return GetPageRoute(
          settings: settings,
          page: () => const BottomMenu(),
          bindings: [],
        );
      case AppRoute.dashboard:
        return GetPageRoute(
          settings: settings,
          page: () => const DashboardScreen(),
          bindings: [],
        );
      case AppRoute.history:
        return GetPageRoute(
          settings: settings,
          page: () => const HistoryScreen(),
          bindings: [],
        );
      case AppRoute.add:
        return GetPageRoute(
          settings: settings,
          page: () => const AddScreen(),
          bindings: [],
        );
      case AppRoute.notification:
        return GetPageRoute(
          settings: settings,
          page: () => const NotificationScreen(),
          bindings: [],
        );
      case AppRoute.account:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountScreen(),
          bindings: [],
        );

      default:
        return GetPageRoute(
          settings: settings,
          page: () => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
