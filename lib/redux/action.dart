import 'package:online_shop_redux/model/product_model.dart';

abstract class AppActions {}

class AddProductAction extends AppActions {
  final ProductModel productModel;

  AddProductAction({required this.productModel});
}

class DeleteProductAction extends AppActions{
  final String name;
  final String price;

  DeleteProductAction({required this.name,required this.price});
}

class ClearCartList extends AppActions{}

class AddToCart extends AppActions{
  final ProductModel productModel;
  AddToCart({required this.productModel});
}

class DeleteFromCart extends AppActions{
  final String name;
  final String price;
  DeleteFromCart({required this.name,required this.price});
}
