import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../components/card_task.dart';
import '../../fonts/fonts.dart';
import 'components/next_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .01,
          horizontal: size.height * .03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const NextTaskComponent(),
            SizedBox(height: size.height * .03),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: Color(blackColor),
                ),
                Text(
                  "Tarefas pendentes",
                  textAlign: TextAlign.right,
                  style: FontGoogle.dosisFont(
                    color: Color(blackColor),
                    letterSpacing: .5,
                    size: size.width * .045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hoje",
                  style: FontGoogle.dosisFont(
                    color: Color(secondaryColor),
                    letterSpacing: .5,
                    size: size.width * .045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: size.width * .01),
                Expanded(
                  child: Divider(
                    color: Color(secondaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .01),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  return const CardTask();
                },
              ),
            ),
            SizedBox(height: size.height * .12),
          ],
        ),
      ),
    );
  }
}
