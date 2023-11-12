import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';

import '../../components/card_task.dart';
import '../../fonts/fonts.dart';

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({super.key});

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() => setState(() {}));

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/AddNewTask"),
        elevation: 2,
        backgroundColor: Color(secondaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .04),
        ),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: size.width * .08,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * .07),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * .02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Color(secondaryAlterColor),
                      size: size.width * .07,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Minhas tarefas",
                          style: FontGoogle.dosisFont(
                            color: Color(secondaryAlterColor),
                            letterSpacing: .5,
                            size: size.width * .06,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: _animationController.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .03),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemBuilder: (context, index) {
                    return const CardTask();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
