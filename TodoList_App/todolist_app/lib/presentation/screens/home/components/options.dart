import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class OptionsHomeScreen extends StatelessWidget {
  const OptionsHomeScreen({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: size.height * .04),
        Row(
          children: [
            Text(
              title,
              style: FontGoogle.interFont(
                color: Color(blackColor),
                size: size.width * .045,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: size.width * .04),
            Text(
              "2 Tarefas",
              style: FontGoogle.interFont(
                color: Colors.grey.shade500,
                size: size.width * .035,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * .005),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: size.width * .15,
            padding: EdgeInsets.symmetric(vertical: size.height * .002),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(size.width),
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        SizedBox(
          height: size.height * .2,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              return Container(
                width: size.width * .35,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .03,
                  vertical: size.height * .015,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * .02,
                  vertical: size.height * .01,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.width * .02),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Titulo da tarefa",
                      maxLines: 2,
                      style: FontGoogle.interFont(
                        color: Colors.grey.shade500,
                        size: size.width * .035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Text(
                      "Descrição resumida",
                      maxLines: 3,
                      style: FontGoogle.interFont(
                        color: Colors.grey.shade500,
                        size: size.width * .035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
