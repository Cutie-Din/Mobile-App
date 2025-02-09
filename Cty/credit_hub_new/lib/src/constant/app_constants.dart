import 'package:flutter/cupertino.dart';

enum AppVisibility { gone, visible, invisible }

enum AppOrientation { horizontal, vertical }

enum AppTextSize { small, middle, large }

enum AppLang { vi, en }

enum TransactionState { waiting, confirmed, cancelled, returned }

class GlobalManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
