import 'package:finance/ui/pages/authenciation/change_pass.dart';
import 'package:finance/ui/pages/authenciation/otp.dart';

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
        '/otp': (context) => OTPScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/history': (context) => const HistoryScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/account': (context) => const AccountScreen(),
      },
    );
  }
}
