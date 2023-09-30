import 'package:flutter/material.dart';

import '../colors/colors.dart';

final gradientColors = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(primaryColor), Color(secondaryColor)],
);