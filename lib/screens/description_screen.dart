import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_redux/config/app_colors.dart';
import 'package:online_shop_redux/config/custom_snackbar.dart';
import 'package:online_shop_redux/model/product_model.dart';
import 'package:online_shop_redux/redux/action.dart';
import 'package:online_shop_redux/redux/state.dart';

class DescriptionScreen extends StatelessWidget {
  final ProductModel product;
  const DescriptionScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          // image
          AspectRatio(
              aspectRatio: 1/0.5,
              child: Image.file(File(product.image),fit: BoxFit.contain,)),

          // price
            const Gap(24),
          Text('${product.price} AFN',style: const TextStyle(color: orange,fontWeight: FontWeight.bold,fontSize: 24),),

          // description
            const Gap(12),
          Text(product.description),
        ],),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: (){
            deleteProduct(context);
          },child: const Icon(Iconsax.trash,color: Colors.white,),backgroundColor: Colors.red,),
          FloatingActionButton(onPressed: (){
                StoreProvider.of<AppState>(context).dispatch(AddToCart(productModel: product));
                CustomSnackBar(context: context, message: 'Added to the Cart',backgroundColor: Colors.black54).show();
              },child: const Icon(Iconsax.shopping_cart),backgroundColor: Colors.white,),

        ],
      ),
    );
  }

  void deleteProduct(BuildContext context){
    StoreProvider.of<AppState>(context).dispatch(DeleteProductAction(name: product.name, price: product.price));
    Navigator.pop(context);
    CustomSnackBar(context: context, message: 'Product Deleted',backgroundColor: Colors.red,).show();
  }

}
