import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../application/interfaces/isplash_services.dart';
import '../../components/gradient.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _splashServices.splashInitialApp(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientColors
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              nameCompany,
              textAlign: TextAlign.center,
              style: FontGoogle.dosisFont(
                color: Colors.white,
                letterSpacing: .5,
                size: size.width * .1,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              buttonhole,
              textAlign: TextAlign.center,
              style: FontGoogle.dosisFont(
                color: Colors.white,
                letterSpacing: .5,
                size: size.width * .04,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * .03),
            Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: size.width * .005,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
