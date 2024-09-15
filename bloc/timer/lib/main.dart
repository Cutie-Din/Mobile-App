import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:timer/timer_observer.dart';

import 'timer/app.dart';

void main() {
  Bloc.observer = const TimerObserver();
  runApp(const MyApp());
}
