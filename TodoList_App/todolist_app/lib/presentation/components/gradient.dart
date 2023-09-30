import 'package:flutter/material.dart';

import '../colors/colors.dart';

final gradientColors = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(primaryColor), Color(secondaryColor)],
);

final gradientSuaveColors = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(secondaryColor),
    Color(secondaryAlterColor),
  ],
);