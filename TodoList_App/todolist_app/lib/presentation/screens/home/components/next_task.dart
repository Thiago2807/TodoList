import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../../../application/interfaces/itodo_services.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../../../components/gradient.dart';
import '../../../fonts/fonts.dart';

class NextTaskComponent extends StatefulWidget {
  const NextTaskComponent({Key? key}) : super(key: key);

  @override
  State<NextTaskComponent> createState() => _NextTaskComponentState();
}

class _NextTaskComponentState extends State<NextTaskComponent>
    with SingleTickerProviderStateMixin {
  final ITodoServices _todoServices = GetIt.instance<ITodoServices>();
  late Future<TodoEntity?> nextTodo;

  @override
  void initState() {
    nextTodo = _todoServices.getNextTaskAsync(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .02,
            horizontal: size.width * .04,
          ),
          decoration: BoxDecoration(
            color: Color(secondaryColor),
            gradient: gradientSuaveColors,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(size.width * .05),
              bottomLeft: Radius.circular(size.width * .05),
              topLeft: Radius.circular(size.width * .01),
              bottomRight: Radius.circular(size.width * .01),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .025,
                      vertical: size.height * .01),
                  decoration: BoxDecoration(
                    color: Color(secondaryAlterColor),
                    borderRadius:
                    BorderRadius.circular(size.width * .01),
                  ),
                  child: Text(
                    "Próxima",
                    style: FontGoogle.dosisFont(
                      color: Colors.white,
                      letterSpacing: .5,
                      size: size.width * .04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: nextTodo,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      {
                        return Text(
                          "Carregando tarefa...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FontGoogle.dosisFont(
                            color: Colors.white,
                            letterSpacing: .5,
                            size: size.width * .04,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                        ;
                      }
                    default:
                      {
                        if (snapshot.data == null) {
                          return Container();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Text(
                              snapshot.data!.title,
                              style: FontGoogle.dosisFont(
                                color: Colors.white,
                                letterSpacing: .5,
                                size: size.width * .05,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              snapshot.data!.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: FontGoogle.dosisFont(
                                color: Colors.white,
                                letterSpacing: .5,
                                size: size.width * .04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Text(
                              DateFormat("dd/MM/yyyy HH:mm").format(snapshot.data!.dhInicio),
                              textAlign: TextAlign.right,
                              style: FontGoogle.dosisFont(
                                color: Colors.white,
                                letterSpacing: .5,
                                size: size.width * .035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
