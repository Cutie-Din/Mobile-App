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
  historydetail,
  add,
  notification,
  account,
  accountdetails,
  accountlist,
  accountadd,
  accountedit,
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
      case AppRoute.historydetail:
        return '/history_detail';
      case AppRoute.add:
        return '/add';
      case AppRoute.notification:
        return '/change_password';
      case AppRoute.account:
        return '/account';
      case AppRoute.accountdetails:
        return '/account_details';
      case AppRoute.accountlist:
        return '/account_list';
      case AppRoute.accountadd:
        return '/account_add';
      case AppRoute.accountedit:
        return '/account_edit';
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
      case AppRoute.historydetail:
        return GetPageRoute(
          settings: settings,
          page: () => const HistoryDetailScreen(),
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
      case AppRoute.accountdetails:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountDetailsScreen(),
          bindings: [],
        );
      case AppRoute.accountlist:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountListScreen(),
          bindings: [],
        );
      case AppRoute.accountadd:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountAddScreen(),
          bindings: [],
        );
      case AppRoute.accountedit:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountEditScreen(),
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
