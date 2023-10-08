import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../fonts/fonts.dart';
import 'gradient.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({
    super.key,
    required this.title,
    required this.content,
    required this.routeString,
    required this.removeUntil,
  });

  final String title;
  final String content;
  final String routeString;
  final bool removeUntil;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final Radius radiusTop = Radius.circular(size.width * .04);

    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        height: size.height / 2,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(radiusTop),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: radiusTop,
                          topRight: radiusTop,
                        ),
                        gradient: gradientSuaveColors,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: FontGoogle.interFont(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .03),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: FontGoogle.interFont(
                          size: size.width * .035,
                          color: Color(blackColor),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: size.width * .05,
                        left: size.width * .1,
                        right: size.width * .1,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (removeUntil) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                routeString, (route) => false);
                          } else {
                            Navigator.of(context).pushNamed(routeString);
                          }
                        },
                        style: TextButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "Confirmar",
                          style: FontGoogle.interFont(
                            color: Color(secondaryAlterColor),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: size.width * .26,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: size.width * .05,
                  child: Icon(
                    Icons.close,
                    color: Color(secondaryAlterColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
