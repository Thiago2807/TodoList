import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../components/gradient.dart';
import '../../fonts/fonts.dart';
import '../../string/strings.dart';

class ErrorSplashScreen extends StatelessWidget {
  const ErrorSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * .55,
                margin: EdgeInsets.symmetric(horizontal: size.width * .1),
                child: Image.asset("images/ErrorSplash.jpg"),
              ),
              Text(
                "Erro",
                textAlign: TextAlign.center,
                style: FontGoogle.dosisFont(
                  color: Color(blackColor),
                  size: size.width * .07,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * .02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                child: Text(
                  errorMessageSplash,
                  textAlign: TextAlign.center,
                  style: FontGoogle.dosisFont(
                    color: Color(blackColor),
                    size: size.width * .045,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * .01, horizontal: size.width * .04),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil("/Splash", (route) => false),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * .02)),
                  padding: EdgeInsets.symmetric(vertical: size.height * .015),
                  backgroundColor: Color(secondaryColor),
                ),
                child: Text(
                  "Tente novamente",
                  style: FontGoogle.robotoFont(
                    color: Colors.white,
                    size: size.width * .04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
