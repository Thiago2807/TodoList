import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../application/interfaces/isplash_services.dart';
import '../../colors/colors.dart';
import '../../fonts/fonts.dart';
import '../../string/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ISplashServices _splashServices = GetIt.instance<ISplashServices>();

  @override
  void initState() {
    super.initState();

    _splashServices.splashInitialApp(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(primaryColor)),
            child: Image.asset("images/SplashImage.jpg"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * .75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(size.width * .1),
                  topLeft: Radius.circular(size.width * .1),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(1, 1),
                    color: Color(0xff1c1c1c),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nameCompany,
                  style: FontGoogle.dosisFont(
                    color: Color(primaryColor),
                    letterSpacing: .5,
                    size: size.width * .1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  buttonhole,
                  style: FontGoogle.dosisFont(
                    color: Color(primaryColor),
                    letterSpacing: .5,
                    size: size.width * .04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: size.height * .15),
                CircularProgressIndicator(
                  color: Color(primaryColor),
                ),
                SizedBox(height: size.height * .02),
                Text(
                  "Loading...",
                  style: FontGoogle.dosisFont(
                    color: Color(primaryColor),
                    letterSpacing: .5,
                    size: size.width * .04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "By Thiago Corp.",
              style: FontGoogle.dosisFont(
                color: Color(primaryColor),
                letterSpacing: .5,
                size: size.width * .04,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
