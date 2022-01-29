import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/productsModel.dart';
import 'package:ecommerce_app/modules/Products/productScreen.dart';
import 'package:ecommerce_app/modules/cart/cartScreen.dart';
import 'package:ecommerce_app/modules/categories/categoriesScreen.dart';
import 'package:ecommerce_app/modules/setting/settingScreen.dart';
import 'package:ecommerce_app/shared/components/constatns.dart';
import 'package:ecommerce_app/shared/network/api/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = <Widget>[
    ProductScreen(),
    CategoriesScreen(),
    CartScreen(0),
    const SettingScreen()
  ];

  void onItemTapped(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  ProductsModel? productsModel;

  List<dynamic> productsData = [];
  List<dynamic> categoriesData = [];
  List<dynamic> categoriesDataId = [];
  void getProducts() {
    emit(LoadingProductsataState());

    DioHelper.getData(
      url: "products",
    ).then((value) {
      // productsModel = ProductsModel.fromJson(value.data);
      productsData = value.data["products"];
      //   productsData= value.data["products"];
      emit(SuccessProductsDataState());
      print(productsData.toString());
    }).catchError((e) {
      emit(ErrorProductsDataState());
      print(e.toString());
    });
  }

  void getCategories() {
    emit(LoadingCategoriesDataState());

    DioHelper.getData(
      url: "categories",
    ).then((value) {
      // productsModel = ProductsModel.fromJson(value.data);
      categoriesData = value.data["categories"];
      //   productsData= value.data["products"];
      emit(SuccessCategoriesDataState());
      print(categoriesData.toString());
    }).catchError((e) {
      emit(ErrorCategoriesState());
      print(e.toString());
    });
  }

  void getCategoriesId() {
    emit(LoadingCategorieIdDataState());

    DioHelper.getData(
      url: "categories",
      query: {"categoryId" : "1" }
    ).then((value) {
      categoriesDataId = value.data["category"];

      emit(SuccessCategorieIdDataState());

      print("c@@@@@@@@" + value.data.toString());

    }).catchError((e) {
      emit(ErrorCategorieIdState());
      print(e.toString());
    });
  }
}
