import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_redux/config/app_colors.dart';
import 'package:online_shop_redux/screens/add_product_screen.dart';
import 'package:online_shop_redux/screens/cart_screen.dart';
import 'package:online_shop_redux/screens/favourites_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            // profile
            const Gap(58),
            const Row(children: [
              CircleAvatar(backgroundColor: Colors.white,minRadius: 24,child: Icon(Icons.person,color: Colors.black54,),),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('User',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text('example@gmail.com',style: TextStyle(fontSize: 12),),
              ],)

            ],),
            const Gap(24),
            const Divider(),
            const Gap(24),
            // options
            Option(icon: Iconsax.add,title: 'Add Product',onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),));
            },),
            Option(icon: Iconsax.heart,title: 'Favourites',onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritesScreen(),));
            },),
            Option(icon: Iconsax.shopping_cart,title: 'Cart',onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
            },),

          ],

          ),
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  const Option({
    super.key, required this.icon, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon,color: Colors.black87,),
      CupertinoButton(child: Text(title,style: const TextStyle(color: Colors.black87),), onPressed:onPressed ),
    ],);
  }
}
