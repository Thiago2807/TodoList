import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../fonts/fonts.dart';
import '../state/auth_state.dart';

class MessageInitial extends StatelessWidget {
  const MessageInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    final AuthState stateScreen = Provider.of<AuthState>(context);

    return SafeArea(
      child: Observer(
        builder: (context) {
          if (stateScreen.loginScreen) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Acesse sua conta",
                  textAlign: TextAlign.start,
                  style: FontGoogle.interFont(
                    size: size.width * .065,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Text(
                  "Faça login na sua conta com facilidade!",
                  textAlign: TextAlign.start,
                  style: FontGoogle.interFont(
                    size: size.width * .03,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Crie sua conta agora!",
                  textAlign: TextAlign.start,
                  style: FontGoogle.interFont(
                    size: size.width * .065,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Text(
                  "Crie sua conta e aproveite nossos benefícios!",
                  textAlign: TextAlign.start,
                  style: FontGoogle.interFont(
                    size: size.width * .03,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
