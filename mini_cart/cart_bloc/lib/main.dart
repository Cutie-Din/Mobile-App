import 'dart:async';

import 'package:cart_bloc/main_bloc.dart';
import 'package:cart_bloc/main_cubit.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  final cubit = CounterCubit();
  final subscription = cubit.stream.listen(print);
  cubit.increment();
  cubit.increment();
  cubit.increment();

  cubit.decrement();
  cubit.decrement();
  cubit.decrement();

  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}
// Sử dụng cubit