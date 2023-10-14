import 'package:flutter/material.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width * .3,
      height: size.height * .2,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tarefas")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
