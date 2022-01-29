import 'package:ecommerce_app/modules/login/loginScreen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SginUpScreen extends StatelessWidget {
  SginUpScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();

  var sginUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: sginUpFormKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        margin: const EdgeInsets.only(
                          right: 70,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 16, right: 32),
                                    child: defaultFormField(
                                      controller: nameController,
                                      type: TextInputType.text,
                                      validate: (value) {
                                        if (nameController.text.isEmpty) {
                                          return "Name is Empty";
                                        }
                                      },
                                      label: 'UserName',
                                      prefix: Icons.person,
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(left: 16, right: 32),
                                    child: defaultFormField(
                                      controller: mailController,
                                      type: TextInputType.emailAddress,
                                      validate: (value) {
                                        if (mailController.text.isEmpty) {
                                          return "Email is Empty";
                                        }
                                      },
                                      label: 'EmailAddress',
                                      prefix: Icons.alternate_email,
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(left: 16, right: 32),
                                    child: defaultFormField(
                                      controller: passController,
                                      isPassword: true,
                                      type: TextInputType.text,
                                      validate: (value) {
                                        if (passController.text.isEmpty) {
                                          return "Password is Empty";
                                        }
                                      },
                                      label: 'Password',
                                      prefix: Icons.password,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            if (sginUpFormKey.currentState!.validate()) {
                              navigateFinish(context, LoginScreen());
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange[200]!.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xfff59f45),
                                  Color(0xfff59f45),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 24),
                      child: TextButton(
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffe98f60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/logo.png",
                      width: 100,
                      height: 100,
                    ),

                    const     SizedBox(width: 20,),
                    Image.asset(
                      "assets/image/orange.png",
                      width: 150,
                      height: 150,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ));
  }
}
