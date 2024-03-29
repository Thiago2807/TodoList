import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../fonts/fonts.dart';
import 'gradient.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({
    super.key,
    this.functionAction,
    required this.title,
    required this.content,
    this.routeString,
    this.removeUntil,
  });

  final String title;
  final String content;
  final String? routeString;
  final bool? removeUntil;
  final VoidCallback? functionAction;

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
        child: Align(
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
                  padding: EdgeInsets.symmetric(vertical: size.height * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: radiusTop,
                      topRight: radiusTop,
                    ),
                    gradient: gradientSuaveColors,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(1, 1),
                          color: Colors.black12)
                    ],
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * .03),
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
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          if (functionAction != null) {
                            functionAction!();
                          } else {
                            if (removeUntil!) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  routeString!, (route) => false);
                            } else {
                              Navigator.of(context).pushNamed(routeString!);
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "Confirmar",
                          style: FontGoogle.interFont(
                            size: size.width * .035,
                            fontWeight: FontWeight.w500,
                            color: Color(secondaryAlterColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "Cancelar",
                          style: FontGoogle.interFont(
                            size: size.width * .035,
                            fontWeight: FontWeight.w500,
                            color: Color(secondaryAlterColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
