import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../domain/enum/status_todo_enum.dart';
import '../state/add_task_state.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({super.key});

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    final AddTaskState stateScreen = Provider.of<AddTaskState>(context);
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (context) => DropdownButton(
        isExpanded: true,
        elevation: 5,
        value: stateScreen.valueDrop,
        dropdownColor: theme.colorScheme.scrim,
        padding: EdgeInsets.symmetric(
            vertical: size.height * .01, horizontal: size.width * .02),
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(size.width * .02),
        style: theme.textTheme.displaySmall?.copyWith(
          fontSize: size.width * .04,
        ),
        items: const [
          DropdownMenuItem(
            value: StatusTodoEnum.activated,
            child: Text("Ativa"),
          ),
          DropdownMenuItem(
            value: StatusTodoEnum.priority,
            child: Text("Prioridade"),
          ),
          DropdownMenuItem(
            value: StatusTodoEnum.inProgress,
            child: Text("Em progresso"),
          )
        ],
        onChanged: (value) => setState(() =>
            stateScreen.alterValueDrop(value ?? StatusTodoEnum.activated)),
      ),
    );
  }
}
