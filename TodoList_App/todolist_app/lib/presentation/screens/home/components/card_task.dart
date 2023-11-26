import 'package:flutter/material.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';

import '../../../fonts/fonts.dart';

class CardTaskHomeScreen extends StatelessWidget {
  const CardTaskHomeScreen({
    super.key,
    required this.todo,
  });

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

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
        color: theme.colorScheme.tertiaryContainer,
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
            todo.title,
            maxLines: 2,
            style: FontGoogle.interFont(
              color: Colors.grey.shade500,
              size: size.width * .035,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * .01),
          Text(
            todo.description,
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
  }
}
