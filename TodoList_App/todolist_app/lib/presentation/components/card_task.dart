import 'package:flutter/material.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';

import '../colors/colors.dart';
import '../fonts/fonts.dart';

class CardTask extends StatelessWidget {
  const CardTask({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .01),
      padding: EdgeInsets.symmetric(
          vertical: size.height * .025, horizontal: size.width * .045),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(size.width * .015),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(1, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  todo.title,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: FontGoogle.interFont(
                    color: theme.colorScheme.secondary,
                    size: size.width * .045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * .01),
                Text(
                  todo.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: FontGoogle.interFont(
                    color: Colors.grey.shade500,
                    size: size.width * .035,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "00:00",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FontGoogle.dosisFont(
              color: theme.colorScheme.secondary,
              letterSpacing: .5,
              size: size.width * .045,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
