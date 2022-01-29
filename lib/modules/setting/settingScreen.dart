import 'package:ecommerce_app/modules/login/loginScreen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(




            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            const SizedBox(
            height: 115,
            width: 115,
            child:
            CircleAvatar(
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTue0QzcbncaPSxMCpLhzOab4a1Sux6xXpow&usqp=CAU"),
            ),),
              profileMenu("My Account", Icons.person, () {}),

              profileMenu("Settings", Icons.settings, () {}),

              profileMenu("LogOut", Icons.arrow_back_ios, () {



                navigateFinish(context, LoginScreen());
              }),
            ],
          ),
        ),
      ),
      ) ;
  }
}
