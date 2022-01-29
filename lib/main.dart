import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/modules/productsType/productsTypeScreen.dart';
import 'package:ecommerce_app/shared/components/constatns.dart';
import 'package:ecommerce_app/shared/network/api/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/login/loginScreen.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProducts()..getCategories()..getCategoriesId(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: LoginScreen(),
      ),
    );
  }
}


