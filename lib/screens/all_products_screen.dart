import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_redux/config/app_colors.dart';
import 'package:online_shop_redux/model/product_model.dart';
import 'package:online_shop_redux/redux/state.dart';
import 'package:online_shop_redux/screens/add_product_screen.dart';
import 'package:online_shop_redux/widgets/app_drawer.dart';
import 'package:online_shop_redux/widgets/product_item.dart';

import 'cart_screen.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Afghan Mall',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
          }, icon: const Icon(Iconsax.shopping_cart,))
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            },icon: const Icon(Iconsax.menu_1),);
          }
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [

          // all products text
          const Gap(24),
          const Align(alignment: Alignment.centerLeft, child: Text('All Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),


          // all products
          const Gap(24),
          Expanded(
            child: StoreConnector<AppState,List<ProductModel>>(
              converter: (store) {
                return store.state.productsList;
              },
              builder: (context, productList) {
                return productList.isNotEmpty? GridView.builder(
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

                ) : Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.bag_cross_1,size: 80,color: Colors.black54,),
                    const Gap(24),
                    const Text('No Product, Start Adding Some',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    CupertinoButton(child: const Text('+ Add Product',style: TextStyle(color: orange),), onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),));
                    })
                  ],
                ),);
              },
            ),
          )


        ],),
      ),
    );
  }
}
