import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/utils/constants.dart';
import 'package:firebaseapp/views/homepage.dart';
import 'package:firebaseapp/views/register.dart';
import 'package:firebaseapp/widgets/Error.dart';
import 'package:firebaseapp/widgets/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  signInUser() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        },
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      emailController.text = "";
      passwordController.text = "";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ErrorDialog("The password provided is too weak.");
            });
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ErrorDialog("The account already exists for that email.");
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ErrorDialog("$e");
          });
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 40, bottom: 10),
                  child: Image.asset(
                    ImageContants.btnBack,
                    height: 40,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  ImageContants.logo,
                  height: 30,
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    StringConstants.appName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontsConstants.Bold,
                      color: Color(ColorConstants.PrimaryColor),
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  StringConstants.login,
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(ColorConstants.GreenColor),
                      fontFamily: FontsConstants.Bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  StringConstants.loginDesc,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(ColorConstants.GreenColor),
                      fontFamily: FontsConstants.Regular),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  StringConstants.username,
                  style: TextStyle(
                      fontFamily: FontsConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.GrayColor)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(ColorConstants.GrayColor)),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Color(ColorConstants.GrayColor),
                      ),
                      hintText: "Enter your email address"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  StringConstants.password,
                  style: TextStyle(
                      fontFamily: FontsConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.GrayColor)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(ColorConstants.GrayColor)),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.password_outlined,
                        color: Color(ColorConstants.GrayColor),
                      ),
                      hintText: "Enter your password"),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                  StringConstants.forgotPassword,
                  style: TextStyle(
                      fontFamily: FontsConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.PrimaryColor)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    signInUser();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(ColorConstants.GreenColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      StringConstants.login,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(ColorConstants.GreenColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      StringConstants.register,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
