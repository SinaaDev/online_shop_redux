import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_redux/redux/action.dart';
import 'package:online_shop_redux/redux/state.dart';
import 'package:online_shop_redux/widgets/cart_item.dart';

import '../model/product_model.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [
          const Gap(24),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Spacer(),
              StoreBuilder<AppState>(
                  builder: (context, vm) {
                    return Text('${vm.state.totalPrice()} AFN',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                  },
              ),
              const Gap(12),
              SizedBox(
                  width: 100,
                  height: 40,
                  child: StoreConnector<AppState, VoidCallback>(
                    converter: (store) {
                      return ()=> store.dispatch(ClearCartList());
                    },
                    builder: (context, callback) {
                      return CupertinoButton(child: const Text('Order'), onPressed:callback ,color: Colors.black54,padding: EdgeInsets.zero,);
                    },
                  ))
            ],),
          ),
          const Gap(24),
          Expanded(
            child: StoreConnector<AppState,List<ProductModel>>(
              converter: (store) {
                return store.state.cartList;
              },
              builder: (context, cartList) {
                return cartList.isNotEmpty? ListView.builder(
                  itemBuilder:(context, i) {
                    return CartItem(product: cartList[i]);
                  },
                  itemCount: cartList.length,

                ) : const Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.bag_cross_1,size: 80,color: Colors.black54,),
                    Gap(24),
                    Text('No Item in the Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),);
              },
            ),
          ),
        ],),
      ),),
    );
  }
}
