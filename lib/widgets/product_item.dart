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
import 'package:online_shop_redux/screens/description_screen.dart';

class ProductItem extends StatefulWidget {
final ProductModel product;
  const ProductItem({super.key, required this.product,});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(product: widget.product),));
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.file(File(widget.product.image),fit: BoxFit.cover,height: 120,)),
              const Gap(12),
              const Spacer(),
              Text(widget.product.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              const Gap(4),
              Text('${widget.product.price} AFN',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: orange),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      widget.product.favorite = !widget.product.favorite;
                    });
                  }, icon:widget.product.favorite? const Icon(Iconsax.heart5,color: orange,):const Icon(Iconsax.heart)),
                  const Text('Review'),
                  StoreConnector<AppState,VoidCallback>(
                      converter: (store) {
                        return ()=>store.dispatch(AddToCart(productModel: widget.product));
                      },
                      builder: (context, callback) {
                        return IconButton(onPressed: (){
                          callback();
                          CustomSnackBar(context: context, message: 'Added to the Cart',backgroundColor: Colors.black54).show();
                        }, icon: const Icon(Iconsax.shopping_cart));
                      },
                  ),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
