import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  var itemIndex;

  CartScreen(this.itemIndex);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: ListView.builder(
          itemBuilder: (context, index) =>
              buildCatItem(AppCubit.get(context).productsData[itemIndex] , ),
              itemCount: 3,
        ));
      },
    );
  }
}
