import 'package:flutter/material.dart';

import '../../../fonts/fonts.dart';
import 'card_task.dart';

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
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: size.height * .04),
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: size.width * .045,
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
              return const CardTaskHomeScreen();
            },
          ),
        ),
      ],
    );
  }
}
