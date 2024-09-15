import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_bloc/blocs.dart';
import 'package:cart_bloc/cubits.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'app.dart';

Future<void> main(List<String> args) async {
  Bloc.observer = SimpleCubit(); //Observer BloC
  /*-Sử dụng RoleCubit-*/
  final cubitRole = RoleCubit(); //Cubit Role
  final subscription_cubitRole = cubitRole.stream.listen(print);

  cubitRole.fetchJunior();
  await Future.delayed(Duration(seconds: 2));

  cubitRole.fetchSenior();
  await Future.delayed(Duration(seconds: 2));

  await subscription_cubitRole.cancel();
  await cubitRole.close();
  /*-Sử dụng CounterCubit-*/
  final cubitCounter = CounterCubit(); //Cubit Counter
  final subscription_cubitCounter = cubitCounter.stream.listen(
      print); //Sử dụng Stream để có thể ghi nhận cập nhật trạng thái theo thời gian thực
  cubitCounter.increment();
  await Future.delayed(Duration(seconds: 2));
  cubitCounter.increment();
  await Future.delayed(Duration(seconds: 2));
  cubitCounter.increment();
  await Future.delayed(Duration(seconds: 2));

  cubitCounter.decrement();
  await Future.delayed(Duration(seconds: 2));
  cubitCounter.decrement();
  await Future.delayed(Duration(seconds: 2));
  cubitCounter.decrement();
  await Future.delayed(Duration(seconds: 2));

  await subscription_cubitCounter.cancel();
  await cubitCounter.close();
}

//