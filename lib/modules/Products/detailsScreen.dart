import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
var index;


DetailsScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {


    var cubit = AppCubit.get(context);
    return buildDetails(cubit.productsData[index]);
  },
),
    );
  }
}
