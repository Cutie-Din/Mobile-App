import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/list_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = const ListObserver();
  runApp(const App());
}
