import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../../components/gradient.dart';
import '../../../fonts/fonts.dart';

class NextTaskComponent extends StatelessWidget {
  const NextTaskComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .02,
            horizontal: size.width * .04,
          ),
          decoration: BoxDecoration(
            color: Color(secondaryColor),
            gradient: gradientSuaveColors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(size.width * .05),
              bottomLeft: Radius.circular(size.width * .05),
              topLeft: Radius.circular(size.width * .01),
              bottomRight: Radius.circular(size.width * .01),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .025,
                      vertical: size.height * .01),
                  decoration: BoxDecoration(
                    color: Color(secondaryAlterColor),
                    borderRadius: BorderRadius.circular(size.width * .01),
                  ),
                  child: Text(
                    "Próxima",
                    style: FontGoogle.dosisFont(
                      color: Colors.white,
                      letterSpacing: .5,
                      size: size.width * .04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                "Titulo da tarefa",
                style: FontGoogle.dosisFont(
                  color: Colors.white,
                  letterSpacing: .5,
                  size: size.width * .05,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * .005,
              ),
              Text(
                "Aqui vai ficar os detalhes da tarefa",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FontGoogle.dosisFont(
                  color: Colors.white,
                  letterSpacing: .5,
                  size: size.width * .04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                "00/00/0000 00:00",
                textAlign: TextAlign.right,
                style: FontGoogle.dosisFont(
                  color: Colors.white,
                  letterSpacing: .5,
                  size: size.width * .035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
