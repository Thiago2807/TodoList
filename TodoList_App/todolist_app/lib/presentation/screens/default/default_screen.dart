import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/application/interfaces/idefault_services.dart';

import '../../../application/preferences/auth_preferences.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/keys/keys.dart';
import '../../bloc/states/default_states.dart';
import '../../colors/colors.dart';
import '../../components/alert_dialog.dart';
import '../../fonts/fonts.dart';
import '../home/home_screen.dart';
import '../list_tasks/list_tasks_screen.dart';
import 'default_bloc.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  State<DefaultScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DefaultScreen> {
  final IDefaultServices _defaultServices = GetIt.instance<IDefaultServices>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    List<Widget> screens = [
      const HomeScreen(),
      const ListTaskScreen(),
      const Text("Aqui vai ficar o perfil do usuário"),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * .07),
        child: BlocBuilder<DefaultScreenBloc, DefaultState>(
          builder: (context, state) {
            if (state is StateDefault) {
              return AppBar(
                elevation: 0,
                centerTitle: !(state.indexScreen == 0),
                backgroundColor: Colors.grey.shade200,
                title: FutureBuilder<UserEntity>(
                  future: _defaultServices.getDataUserAsync(),
                  builder: (context, snapshot) {
                    String nameUser = "Carregando perfil...";

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return CircularProgressIndicator(
                          color: Color(secondaryAlterColor),
                          strokeWidth: size.width * .004,
                        );
                      default:
                        {
                          nameUser = snapshot.data == null
                              ? "Seja bem-vindo(a)"
                              : "Olá, ${snapshot.data!.name}";
                          return Text(
                            nameUser,
                            style: FontGoogle.robotoFont(
                              color: Color(secondaryColor),
                              letterSpacing: .3,
                              size: size.width * .05,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }
                    }
                  },
                ),
                actions: [
                  PopupMenuButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(size.width * .02),
                    ),
                    splashRadius: 10,
                    itemBuilder: (context) {
                      return <PopupMenuItem>[
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(
                                size: size.width * .05,
                                color: Color(secondaryAlterColor),
                                Icons.settings_outlined,
                              ),
                              SizedBox(width: size.width * .02),
                              Text(
                                "Configurações",
                                style: FontGoogle.dosisFont(
                                  color: Color(secondaryAlterColor),
                                  letterSpacing: .5,
                                  size: size.width * .04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                size: size.width * .05,
                                color: Color(secondaryAlterColor),
                                Icons.exit_to_app_outlined,
                              ),
                              SizedBox(width: size.width * .02),
                              Text(
                                "Sair",
                                style: FontGoogle.dosisFont(
                                  color: Color(secondaryAlterColor),
                                  letterSpacing: .5,
                                  size: size.width * .04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) =>
                              const AlertDialogComponent(
                                removeUntil: true,
                                routeString: "/Splash",
                                title: "Encerrar Sessão",
                                content:
                                "Você está prestes a encerrar a sessão. Tem certeza de que deseja sair do aplicativo agora?",
                              ),
                            );

                            await AuthPreferences.deletePreferencesAsync(
                                credentialsUser);
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
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
      body: BlocBuilder<DefaultScreenBloc, DefaultState>(
        builder: (context, state) {
          if (state is StateDefault) return screens[state.indexScreen];

          return Container();
        },
      ),
    );
  }
}
