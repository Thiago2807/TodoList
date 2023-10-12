import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/application/interfaces/idefault_services.dart';
import 'package:todolist_app/presentation/bloc/events/default_events.dart';

import '../../../application/preferences/auth_preferences.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/keys/keys.dart';
import '../../bloc/states/default_states.dart';
import '../../colors/colors.dart';
import '../../components/alert_dialog.dart';
import '../../fonts/fonts.dart';
import '../home/home_screen.dart';
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
    final controller = NotchBottomBarController(index: 0);
    final bloc = context.read<DefaultScreenBloc>();
    final Size size = MediaQuery.sizeOf(context);

    List<Widget> screens = [
      const HomeScreen(),
      Container(child: const Text("Ele está aqui")),
      Container(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
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
              borderRadius: BorderRadius.circular(size.width * .02),
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
                      builder: (context) => const AlertDialogComponent(
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
          ),
        ],
      ),
      body: BlocBuilder<DefaultScreenBloc, DefaultState>(
        builder: (context, state) {
          if (state is StateDefault) {
            return Stack(
              children: [
                screens[state.indexScreen],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedNotchBottomBar(
                    durationInMilliSeconds: 200,
                    showBlurBottomBar: true,
                    bottomBarWidth: size.width,
                    onTap: (value) =>
                        bloc.add(AlterScreenDefaultScreen(indexScreen: value)),
                    bottomBarItems: [
                      BottomBarItem(
                        activeItem: Icon(
                          Icons.checklist_rounded,
                          color: Color(secondaryAlterColor),
                        ),
                        inActiveItem: Icon(
                          Icons.list,
                          color: Color(blackColor),
                        ),
                      ),
                      BottomBarItem(
                        activeItem: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color(secondaryAlterColor),
                        ),
                        inActiveItem: Icon(
                          Icons.add_circle_rounded,
                          color: Color(blackColor),
                        ),
                      ),
                      BottomBarItem(
                        activeItem: Icon(
                          Icons.person_2_outlined,
                          color: Color(secondaryAlterColor),
                        ),
                        inActiveItem: Icon(
                          Icons.person_2_rounded,
                          color: Color(blackColor),
                        ),
                      ),
                    ],
                    notchBottomBarController: controller,
                  ),
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
