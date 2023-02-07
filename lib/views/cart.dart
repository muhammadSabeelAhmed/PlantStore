import 'package:firebaseapp/utils/constants.dart';
import 'package:firebaseapp/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/CartItemsWidget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  int getPayment() {
    for (var i = 0; i < StringConstants.cartItems.length - 1; i++) {
      StringConstants.total = 0;
      StringConstants.total += StringConstants.cartItems[i].price;
    }
    return StringConstants.total;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  HomeAppBar2(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Bag",
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(ColorConstants.GreenColor),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: StringConstants.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = StringConstants.cartItems[index];
                      return CartItemsWidget(product, index);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(ColorConstants.PrimaryColor),
                            fontFamily: FontsConstants.Bold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$ ${StringConstants.total}",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(ColorConstants.PrimaryColor),
                            fontFamily: FontsConstants.Bold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              // bottom: -10,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartView()),
                  );
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(ColorConstants.GreenColor),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImageContants.cart,
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "View ${StringConstants.cartItems.length} items",
                            style: TextStyle(
                                fontFamily: FontsConstants.Regular,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        "\$ ${StringConstants.total}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
