import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_cart/cart_observer.dart';
import 'package:mini_cart/shop_cart/bloc/bloc.dart';
import 'package:mini_cart/shop_cart/view/cart_page.dart';
import 'package:mini_cart/shop_cart/view/shop_page.dart';

import 'app.dart';

void main() {
  Bloc.observer = CartObserver();
  runApp(
    BlocProvider(
      create: (BuildContext context) => CartBloc(),
      child: const MyApp(),
    ),
  );
}
