import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../state/auth_state.dart';

class Input extends StatelessWidget {
  Input(
      {Key? key,
      required this.textEditingController,
      required this.labelInput,
      required this.indexIcon})
      : super(key: key);

  final int indexIcon;
  final String labelInput;
  final TextEditingController textEditingController;

  final List<IconData> icons = [
    Icons.alternate_email_rounded,
    Icons.face_unlock_rounded,
    Icons.lock_rounded
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);
    final Radius radiusSize = Radius.circular(size.width * .03);

    final AuthState stateScreen = Provider.of<AuthState>(context);

    return Observer(
      builder: (context) {
        final bool cond = (stateScreen.observablePassword);

        return TextFormField(
            controller: textEditingController,
            cursorColor: const Color(0xff1c1c1c),
            obscureText: indexIcon == 2 && cond,
            decoration: InputDecoration(
              suffixIcon: indexIcon == 2
                  ? cond
                      ? GestureDetector(
                          onTap: () => stateScreen.alterObservablePassword(),
                          child: Icon(
                            CupertinoIcons.eye_solid,
                            size: size.width * .05,
                            color: Colors.grey.shade400,
                          ),
                        )
                      : GestureDetector(
                          onTap: () => stateScreen.alterObservablePassword(),
                          child: Icon(
                            CupertinoIcons.eye_slash_fill,
                            size: size.width * .05,
                            color: Colors.grey.shade400,
                          ),
                        )
                  : null,
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(radiusSize),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(radiusSize * .6),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
              prefixIcon: Icon(
                icons[indexIcon],
                size: size.width * .05,
              ),
              prefixIconColor: Colors.grey.shade400,
              labelText: labelInput,
            ),
            style: theme.textTheme.displaySmall);
      },
    );
  }
}
