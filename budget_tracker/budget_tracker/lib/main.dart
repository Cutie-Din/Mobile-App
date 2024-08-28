import 'package:budget_tracker/features/authentication/screens/onboarding/onboarding.dart';
import 'package:budget_tracker/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'features/personalization/models/fund.dart';
import 'features/personalization/models/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapters
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(FundAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TransactionAdapter());
  }

  // Open the boxes
  await Hive.openBox<Fund>('funds');
  await Hive.openBox<Transaction>('transactions');

  runApp(const App());
}
