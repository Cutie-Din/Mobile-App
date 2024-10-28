import 'import.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DCV Finance',
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInScreen(),
        '/forgotPass': (context) => const ForgotPassScreen(),
        '/changePass': (context) => const ChangePassScreen(),
        '/otp': (context) => const OTPScreen(),
        '/display': (context) => const DisplayScreen(),
        // '/menu': (context) => const BottomMenu(),
        '/dashboard': (context) => const DashboardScreen(),
        '/history': (context) => const HistoryScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/account': (context) => const AccountScreen(),
      },
    );
  }
}
