import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_cart/cart_observer.dart';

import 'shop_cart/bloc/cart_bloc/cart_bloc.dart';
import 'shop_cart/bloc/shop_bloc/shop_bloc.dart';

import 'package:mini_cart/shop_cart/view/cart_page.dart';
import 'package:mini_cart/shop_cart/view/shop_page.dart';

import 'app.dart';

void main() {
  Bloc.observer = CartObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
