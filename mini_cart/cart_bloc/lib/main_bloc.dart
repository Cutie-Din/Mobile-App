import 'package:cart_bloc/blocs.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  /** Sử dụng Counter Bloc**/
  final counterbloc = CounterBloc();
  final subscription_counter = counterbloc.stream.listen(print);
  counterbloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 2));
  counterbloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 2));
  counterbloc.add(CounterIncrementPressed());
  await Future.delayed(Duration(seconds: 2));

  counterbloc.add(CounterDecrementPressed());
  await Future.delayed(Duration(seconds: 2));
  counterbloc.add(CounterDecrementPressed());
  await Future.delayed(Duration(seconds: 2));
  counterbloc.add(CounterDecrementPressed());
  await Future.delayed(Duration(seconds: 2));

  await subscription_counter.cancel();
  await counterbloc.close();

  /** Sử dụng Role Bloc**/
  final rolebloc = RoleBloc();
  final subscription_role = rolebloc.stream.listen(print);
  rolebloc.add(EnrollJunior());
  await Future.delayed(Duration(seconds: 2));
  rolebloc.add(EnrollSenior());
  await Future.delayed(Duration(seconds: 2));
  await subscription_role.cancel();
  await rolebloc.close();
}
