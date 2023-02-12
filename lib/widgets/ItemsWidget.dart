import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/Product.dart';
import 'package:firebaseapp/views/product_details.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ItemsWidget extends StatelessWidget {
  Product product;
  String bg;
  ItemsWidget(this.product, this.bg);

  addToCart(Product product, BuildContext context) async {
    await FirebaseFirestore.instance.collection('cart').add({
      "name": "${product.name}",
      "price": "${product.price}",
      "desc": "${product.description}",
      "rating": "${product.rating}"
    });
    final snackBar = SnackBar(
      content: Text("${product.name} added to Cart"),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          StringConstants.cartItems.remove(product);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    StringConstants.cartItems.add(product);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 250,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(product)),
              );
            },
            child: Stack(
              children: [
                Positioned(
                  top: 15.0,
                  left: 0.0,
                  right: 0.0,
                  child: Image.asset(
                    width: 40,
                    height: 40,
                    ImageContants.bg,
                  ),
                ),
                Image.asset(
                  bg,
                ),
                Image.asset(
                  ImageContants.productbg,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.product_cat.toUpperCase(),
                        style: TextStyle(
                            color: Color(ColorConstants.PrimaryColor),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          product.name,
                          style: TextStyle(
                              color: Color(ColorConstants.PrimaryColor),
                              fontSize: 35,
                              fontFamily: FontsConstants.Bold,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ${product.price}",
                            style: TextStyle(
                                color: Color(ColorConstants.PrimaryColor),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          //Favorites button here
                          Image.asset(
                            ImageContants.fav,
                            height: 30,
                            width: 30,
                          ),
                          //Favorites button end here
                          SizedBox(
                            width: 20,
                          ),
                          //Button for Add to Cart Items
                          Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                addToCart(product, context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(ColorConstants.GreenColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 15.0,
                              ),
                              child: Image.asset(
                                ImageContants.cart,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          )
                          //Add to Cart Button Ends here
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: -30,
          child: Image.asset(
            width: 160,
            height: 220,
            StringConstants.products[product.pid],
          ),
        ),
      ],
    );
  }
}
