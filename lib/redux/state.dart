import 'package:online_shop_redux/redux/action.dart';

import '../model/product_model.dart';

class AppState{
  final List<ProductModel> productsList;
  final List<ProductModel> cartList;

  AppState({required this.productsList,required this.cartList,});

  AppState copyWith({List<ProductModel>? newProductList,List<ProductModel>? newCartList}){
    return AppState(productsList: newProductList ?? productsList,cartList: newCartList ?? cartList);
  }
  
  int totalPrice (){
    int total = 0;
    cartList.forEach((element) {
      total += int.parse(element.price) ;
    },);
    return total;
  }

  bool toggleFav(isFav){
    return isFav = !isFav;
  }

  static AppState initial()=> AppState(
    productsList: [],
    cartList: []
  );
}
AppState reducer(AppState state, dynamic action){
  if(action is AddProductAction){
    return state.copyWith(newProductList: [...state.productsList,action.productModel]);
  }
  if(action is DeleteProductAction){
    var filteredProducts = state.productsList.where((product) => product.name != action.name && product.price != action.price).toList();
    return state.copyWith(newProductList: filteredProducts);
  }
  if(action is ClearCartList){
    return state.copyWith(newCartList: []);
  }
  if(action is AddToCart){
    return state.copyWith(newCartList: [...state.cartList,action.productModel]);
  }
  if(action is DeleteFromCart){
    var filteredCart = state.cartList.where((product) => product.name != action.name && product.price != action.price).toList();
    return state.copyWith(newCartList: filteredCart);
  }

  return state;
}