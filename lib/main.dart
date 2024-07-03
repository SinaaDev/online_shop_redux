import 'package:flutter/material.dart';
import 'package:online_shop_redux/config/app_theme.dart';
import 'package:online_shop_redux/redux/state.dart';
import 'package:online_shop_redux/screens/all_products_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final store = Store<AppState>(reducer, initialState: AppState.initial());
  runApp(MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: AppTheme().themeData,
        debugShowCheckedModeBanner: false,
        home: const AllProductsScreen(),
      ),
    );
  }
}

