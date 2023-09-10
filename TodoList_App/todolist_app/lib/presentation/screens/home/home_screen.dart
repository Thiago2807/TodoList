import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

import '../../colors/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> mouthList = [];
  late int pageIndex;

  List<String> mouth() {
    var now = DateTime.now();
    var remainingMonths = <String>[];

    for (var month = now.month + 1; month <= 24; month++) {
      var date = DateTime(now.year, month);
      var name = DateFormat('MMM').format(date);
      remainingMonths.add(name);
    }

    return remainingMonths;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    mouthList.addAll(mouth());
    pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(primaryColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              UniconsLine.sliders_v_alt,
              size: size.width * .07,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => pageIndex = value),
        currentIndex: pageIndex,
        fixedColor: Color(primaryColor),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(UniconsLine.estate), label: ""),
          BottomNavigationBarItem(icon: Icon(UniconsLine.list_ol_alt), label: ""),
          BottomNavigationBarItem(icon: Icon(UniconsLine.user), label: "")
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * .17,
            decoration: BoxDecoration(
              color: Color(primaryColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width * .12),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
