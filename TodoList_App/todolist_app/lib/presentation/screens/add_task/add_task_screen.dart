import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/application/interfaces/itodo_services.dart';
import 'package:todolist_app/domain/entities/todo_entity.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/screens/add_task/component/dropdown.dart';
import 'package:todolist_app/presentation/screens/add_task/component/input.dart';
import 'package:todolist_app/presentation/screens/add_task/state/add_task_state.dart';
import '../../fonts/fonts.dart';
import 'component/datetime_component.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    this.todo,
    required this.isEditing,
  });

  final TodoEntity? todo;
  final bool isEditing;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final ITodoServices _iTodoServices = GetIt.instance<ITodoServices>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    final AddTaskState stateScreen =
        Provider.of<AddTaskState>(context, listen: false);

    stateScreen.dtTask = widget.todo?.dhInicio;
    stateScreen.timeTask = widget.todo == null
        ? null
        : TimeOfDay.fromDateTime(widget.todo!.dhInicio);

    _titleController.text = (widget.todo == null ? "" : widget.todo!.title);
    _descriptionController.text =
        (widget.todo == null ? "" : widget.todo!.description);

    if (widget.todo != null) {
      stateScreen.alterValueDrop(widget.todo!.statusTodo);
    }

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * .07),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .01),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.close_rounded,
                  size: size.width * .08,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .1, vertical: size.height * .02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.isEditing ? "Editar tarefa" : "Adicionar nova tarefa",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: size.width * .06,
                ),
              ),
              SizedBox(height: size.height * .005),
              Text(
                widget.isEditing
                    ? "Atualize sua tarefa existente e mantenha seu dia produtivo e organizado. "
                    : "Adicione uma nova tarefa e organize seu dia de forma eficiente.",
                style: FontGoogle.interFont(
                  fontWeight: FontWeight.w500,
                  size: size.width * .035,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: size.height * .03),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .02,
                  horizontal: size.width * .03,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(size.width * .03),
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
                  children: [
                    InputAddTask(
                      multiLines: false,
                      textInformation: "Título",
                      textEditingController: _titleController,
                    ),
                    SizedBox(height: size.height * .03),
                    SizedBox(
                      height: size.height * .16,
                      child: InputAddTask(
                        multiLines: true,
                        textInformation: "Descrição",
                        textEditingController: _descriptionController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * .04),
              Text(
                "Informe o status da tarefa",
                style: FontGoogle.interFont(
                  fontWeight: FontWeight.w500,
                  size: size.width * .035,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: size.height * .02),
              const DropdownCustom(),
              SizedBox(height: size.height * .04),
              Text(
                widget.isEditing
                    ? "Informe a data e hora da tarefa"
                    : "Informe a data de inicio da tarefa",
                style: FontGoogle.interFont(
                  fontWeight: FontWeight.w500,
                  size: size.width * .035,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: size.height * .04),
              const DateTimeComponent(),
              SizedBox(height: size.height * .04),
              GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  if (widget.isEditing) {
                  } else {
                    final AddTaskState state =
                        Provider.of<AddTaskState>(context, listen: false);

                    await _iTodoServices.addNewTask(
                      context: context,
                      title: _titleController,
                      statusTodo: state.valueDrop,
                      description: _descriptionController,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * .02),
                  decoration: BoxDecoration(
                    color: Color(secondaryAlterColor),
                    borderRadius: BorderRadius.circular(size.width * .02),
                  ),
                  child: Text(
                    widget.isEditing ? "Editar" : "Adicionar",
                    textAlign: TextAlign.center,
                    style: FontGoogle.interFont(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
