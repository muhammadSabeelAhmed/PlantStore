import 'package:firebaseapp/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/constants.dart';

class CartItemsWidget extends StatelessWidget {
  Product product;
  int index;
  CartItemsWidget(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Container(
          child: Image.asset(
            StringConstants.products[index],
            height: 80,
            width: 60,
          ),
        ),
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontsConstants.Regular,
                  color: Color(ColorConstants.PrimaryColor),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      color: Color(ColorConstants.GreenColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(ColorConstants.PrimaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // trailing: Text(
        //   "\$ ${product.price}",
        //   style: TextStyle(
        //     fontSize: 16,
        //     color: Color(ColorConstants.PrimaryColor),
        //   ),
        // ),
        subtitle: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "+",
                    style: TextStyle(color: Color(ColorConstants.PrimaryColor)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${product.count}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(ColorConstants.PrimaryColor),
                  )),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 40,
                width: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "-",
                    style: TextStyle(color: Color(ColorConstants.PrimaryColor)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.delete,
                color: Color(ColorConstants.GreenColor),
              )
            ],
          ),
        ),
      ),
    );

    // Container(
    //   padding: EdgeInsets.symmetric(horizontal: 20),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Image.asset(
    //         StringConstants.products[index],
    //         height: 80,
    //         width: 80,
    //       ),
    //       Column(
    //         mainAxisSize: MainAxisSize.max,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Text(
    //                 product.name,
    //                 style: TextStyle(
    //                     color: Color(ColorConstants.PrimaryColor),
    //                     fontSize: 18,
    //                     fontFamily: FontsConstants.Bold),
    //               ),
    //               Icon(
    //                 Icons.bookmark_outline,
    //                 color: Color(ColorConstants.GreenColor),
    //               ),
    //               Text(
    //                 "\$ ${product.price}",
    //                 style: TextStyle(
    //                     color: Color(ColorConstants.PrimaryColor),
    //                     fontSize: 18,
    //                     fontFamily: FontsConstants.Bold),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             mainAxisSize: MainAxisSize.max,
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Text(
    //                 "Quanityty 1",
    //                 style: TextStyle(
    //                     color: Color(ColorConstants.PrimaryColor),
    //                     fontSize: 18,
    //                     fontFamily: FontsConstants.Bold),
    //               ),
    //               Icon(
    //                 Icons.delete,
    //                 color: Color(ColorConstants.GreenColor),
    //               ),
    //             ],
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
