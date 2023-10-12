import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../fonts/fonts.dart';

class CardTask extends StatelessWidget {
  const CardTask({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .01),
      padding: EdgeInsets.symmetric(
          vertical: size.height * .01, horizontal: size.width * .03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * .015),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Titulo da tarefa",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FontGoogle.interFont(
                    color: Color(blackColor),
                    size: size.width * .045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: size.width * .06),
              Icon(
                Icons.more_horiz_rounded,
                color: Color(secondaryAlterColor),
              )
            ],
          ),
          SizedBox(height: size.height * .01),
          Text(
            "Descrição da tarefa",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: FontGoogle.interFont(
              color: Colors.grey.shade600,
              size: size.width * .04,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: size.height * .03),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.alarm_rounded,
                  size: size.width * .055,
                  color: Color(secondaryAlterColor),
                ),
                SizedBox(width: size.width * .02),
                Text(
                  "00:00",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FontGoogle.dosisFont(
                    color: Color(secondaryAlterColor),
                    letterSpacing: .5,
                    size: size.width * .045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
