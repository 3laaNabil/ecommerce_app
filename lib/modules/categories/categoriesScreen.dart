import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var cubit = AppCubit.get(context);
        return Container(

          color: Colors.grey.shade200,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              mainAxisSpacing: 0.1,
              crossAxisSpacing: 0.1,
              childAspectRatio: 1 / 1.0,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                cubit.categoriesData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: buildCategoriesItem(cubit.categoriesData[index],context),
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
