import 'package:ecommerce_app/modules/Products/detailsScreen.dart';
import 'package:ecommerce_app/modules/cart/cartScreen.dart';
import 'package:ecommerce_app/modules/productsType/productsTypeScreen.dart';
import 'package:ecommerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import 'constatns.dart';

Widget defaultButton({
  required String text,
  required VoidCallback onTap,
}) {
  return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(mainColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: mainColor),
          ))));
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(dynamic val)? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  bool autofocus = false,
}) {
  return TextFormField(
    controller: controller,
    autofocus: autofocus,
    obscureText: isPassword,
    onTap: () => onTap ?? () {},
    onChanged: (value) => onChange ?? (value),
    onFieldSubmitted: (value) => onSubmit!(value),
    validator: (value) {
      return validate!(value);
    },
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(
        prefix,
        color: Colors.grey,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              color: Colors.grey,
              onPressed: () => suffixPressed,
              icon: Icon(
                suffix,
              ),
            )
          : null,
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget buildGridProducts(model, context, index) {
  return InkWell(
    onTap: () {
      navigateTo(context, DetailsScreen(index));
    },
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image(
                image: model["avatar"] != null
                    ? NetworkImage('${model["avatar"]}')
                    : const AssetImage("assets/image/loading.gif")
                        as ImageProvider,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              '${model["title"]}',
              maxLines: 2,
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 15.0,
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${model["price_final_text"]}',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16.0,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildDetails(model) {
  return Stack(
    children: [
      Column(children: [
        Expanded(
          flex: 60,
          child: Center(
            child: Image(
              image: NetworkImage("${model["avatar"]}"),
            ),
          ),
        ),
        const Spacer(
          flex: 65,
        )
      ]),
      DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.65,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32.0))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(1.0))),
                      height: 4,
                      width: 48,
                    ),
                  ),
                  Text("${model["title"]}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: mainColor)),
                  Text("${model["name"]}",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("${model["price_final_text"]}",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Expanded(
                        child: Text("In Stock : ${model["in_stock"]} "),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${model["description"]}",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: double.infinity,

                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "AddCart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            mainColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: mainColor),
                                    ))))),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}

Widget buildCategoriesItem(model, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, ProductsTypeScreen());

      print("${model["id"]}");
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: model["avatar"] != null
                    ? NetworkImage('${model["avatar"]}')
                    : const NetworkImage(
                        "https://www.techafricanews.com/wp-content/uploads/2020/01/orange.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          color: Colors.black54,
          width: 150,
          height: 50,
          child: Center(
              child: Text(
            "${model["name"]}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ],
    ),
  );
}

Widget buildCatItem(model) {
  return Row(
    children: [
      SizedBox(
        width: 88,
        child: AspectRatio(
          aspectRatio: 0.80,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network("${model["avatar"]}"),
          ),
        ),
      ),
      SizedBox(width: 5),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model["title"]}",
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(color: Colors.black, fontSize: 16),
            maxLines: 2,
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "${model["price"]}",
              style: TextStyle(fontWeight: FontWeight.w600, color: mainColor),
            ),
          )
        ],
      )
    ],
  );
}

Widget profileMenu(String text, IconData icon, VoidCallback press) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextButton(
      style: TextButton.styleFrom(
        primary: mainColor,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color(0xFFF5F6F9),
      ),
      onPressed: press,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20),
          Expanded(child: Text(text)),
        ],
      ),
    ),
  );
}
