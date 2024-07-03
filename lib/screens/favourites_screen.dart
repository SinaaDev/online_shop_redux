import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model/product_model.dart';
import '../redux/state.dart';
import '../widgets/product_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: StoreConnector<AppState,List<ProductModel>>(
          converter: (store) {
            return store.state.productsList.where((product) => product.favorite == true,).toList();
          },
          builder: (context, productList) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12
              ),
              itemBuilder:(context, i) {
                return ProductItem(product: productList[i],);
              },
              itemCount: productList.length,
            );
          },
        ),
      ),),
    );
  }
}
