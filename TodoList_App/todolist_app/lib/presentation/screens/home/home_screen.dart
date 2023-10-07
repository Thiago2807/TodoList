import 'package:flutter/material.dart';

import '../../../application/preferences/auth_preferences.dart';
import '../../../domain/keys/keys.dart';
import '../../colors/colors.dart';
import '../../fonts/fonts.dart';
import 'components/next_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Olá, Thiago",
          style: FontGoogle.robotoFont(
            color: Color(secondaryColor),
            letterSpacing: .3,
            size: size.width * .05,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          PopupMenuButton(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width * .02),
            ),
            itemBuilder: (context) {
              return <PopupMenuItem>[
                PopupMenuItem(
                  child: Text(
                    "Configurações",
                    style: FontGoogle.dosisFont(
                      color: Color(blackColor),
                      letterSpacing: .5,
                      size: size.width * .04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Sair",
                    style: FontGoogle.dosisFont(
                      color: Color(blackColor),
                      letterSpacing: .5,
                      size: size.width * .04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () async {
                    await AuthPreferences.deletePreferencesAsync(credentialsUser);

                    if (context.mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil("/Splash", (route) => false);
                    }
                  },
                )
              ];
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * .03,
              ),
              child: Icon(
                Icons.more_vert_rounded,
                color: Color(secondaryColor),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .01,
          horizontal: size.height * .03,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NextTaskComponent(),

            Text("Lista das tarefas e botão para adicionar uma nova tarefa"),
            Divider(),
            Text("Bottom navigator ali embaixo")
          ],
        ),
      ),
    );
  }
}
