import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/constants.dart';

class ErrorDialog extends StatelessWidget {
  String error;
  ErrorDialog(this.error);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(ColorConstants.OffWhite),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Error!",
              style: TextStyle(
                fontSize: 26,
                fontFamily: FontsConstants.Bold,
                color: Color(ColorConstants.GreenColor),
              ),
            ),
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            Text(
              error,
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontsConstants.Regular,
                color: Color(ColorConstants.PrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
