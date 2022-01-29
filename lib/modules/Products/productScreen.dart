import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/layout/cubit/app_cubit.dart';
import 'package:ecommerce_app/models/productsModel.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  CarouselSlider(

                    items: [
                      Image.network(
                          "https://previews.123rf.com/images/liaarevadze/liaarevadze1708/liaarevadze170800127/84173579-super-sale-banner-design-for-mobile-and-online-shop-concept-digital-marketing-store-ecommerce-shoppi.jpg"),
                      Image.network(
                      "https://www.techafricanews.com/wp-content/uploads/2020/01/orange.jpg"),

                      Image.network(
                          "https://www.amit-learning.com/assets/logo.png")

                    ],
                    options: CarouselOptions(

                      viewportFraction: 0.8,
                      autoPlayAnimationDuration: const Duration(milliseconds: 100),
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GridView.count(
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.5,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        AppCubit.get(context).productsData.length,
                        (index) => buildGridProducts(
                            AppCubit.get(context).productsData[index],
                            context, index)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
