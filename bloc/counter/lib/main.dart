import 'package:bloc/bloc.dart';
import 'package:counter/counter_observer.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
