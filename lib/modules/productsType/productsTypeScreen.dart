import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/components/constatns.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTypeScreen extends StatelessWidget {
  // ProductsTypeScreen({required this.cId});
  //
  //
  // var cId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.5,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                  AppCubit.get(context).categoriesDataId.length,
                  (index) => buildCatItem(AppCubit.get(context).categoriesDataId[index])
            ),
          ),
        ));
      },
    );
  }
}
