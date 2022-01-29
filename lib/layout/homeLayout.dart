import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/modules/Products/productScreen.dart';
import 'package:ecommerce_app/modules/categories/categoriesScreen.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {


        var cubit = AppCubit.get(context);

        return Scaffold(

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: DotNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.onItemTapped,
            // dotIndicatorColor: Colors.black,
            items: [

              /// Home
              DotNavigationBarItem(
                icon: Icon(Icons.home),
                selectedColor: mainColor,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(Icons.local_mall_rounded),
                selectedColor: mainColor,
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                selectedColor: mainColor,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.settings),
                selectedColor: mainColor,
              ),

            ],
          ),
        );
      },
    );
  }
}


