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
        '/menu': (context) => const BottomMenu(),
        '/first': (context) => const DashboardScreen(),
        '/second': (context) => const HistoryScreen(),
        '/third': (context) => AddScreen(),
        '/fourth': (context) => const NotificationScreen(),
        '/fifth': (context) => const AccountScreen(),
      },
    );
  }
}
