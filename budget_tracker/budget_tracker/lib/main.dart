import 'package:budget_tracker/features/authentication/screens/onboarding/onboarding.dart';
import 'package:budget_tracker/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'features/personalization/models/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(TransactionAdapter());

  // Open the box
  await Hive.openBox<Transaction>('transactions');

  runApp(const App());
}
