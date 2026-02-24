import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  // Base Size
  static const double designWidth = 390;
  static const double designHeight = 844;

  static late double _scaleW;
  static late double _scaleH;
  static late double _scaleText;

  // Initialize dimensions with context
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _scaleW = size.width / designWidth;
    _scaleH = size.height / designHeight;
    _scaleText = _scaleW;
  }

  // Scaling helpers
  static double w(double v) => v * _scaleW;
  static double h(double v) => v * _scaleH;
  static double sp(double v) => v * _scaleText;
  static double r(double v) => v * _scaleW;

  // App Bar
  static double get appBarWidth => w(390);
  static double get appBarHeight => h(100);

  // Ellipse
  static double get ellipseWidth => w(222);
  static double get ellipseHeight => h(203.7);
  static double get ellipseTop => h(-145.93);
  static double get ellipseLeft => w(84);

  // App Bar Items
  static double get appBarItemsWidth => w(343);
  static double get appBarItemsHeight => h(24);
  static double get appBarItemsTop => h(66);
  static double get appBarItemsLeft => w(23);
  static double get appBarItemsGap => w(127);

  // Buttons & Icons
  static double get backButtonSize => w(20);
  static double get cartButtonWidth => w(19.5);
  static double get cartButtonHeight => h(21);

  // Search Bar
  static double get searchBarWidth => w(343);
  static double get searchBarHeight => h(44);
  static double get searchBarRadius => r(999);

  // Country Container
  static double get countryContainerWidth => w(117);
  static double get countryContainerHeight => h(40);
  static double get countryContainerRadius => r(30);
  static double get flagSize => w(24);

  // Buttons Row
  static double get buttonHeight => h(32);
  static double get buttonRadius => r(20);

  // Cards
  static double get itemCardWidth => w(109);
  static double get itemCardHeight => h(135);
  static double get itemCardRadius => r(16);

  static double get secondCardWidth => w(168);
  static double get secondCardHeight => h(164);
  static double get secondCardRadius => r(16);

  // Bottom Sheet
  static double get bottomSheetHeight => h(134);
  static double get checkoutButtonWidth => w(342);
  static double get checkoutButtonHeight => h(45);
  static double get checkoutButtonRadius => r(24);

  // Padding System
  static double get pXS => w(2);
  static double get pS => w(4);
  static double get pM => w(8);
  static double get pL => w(10);
  static double get pXL => w(14);
  static double get pXXL => w(16);
  static double get pHuge => w(24);

  // Radius
  static double get rS => r(4);
  static double get rM => r(8);
  static double get rL => r(12);
  static double get rXL => r(16);
  static double get rRound => r(20);
  static double get rFull => r(30);
  static double get rmax => r(999);
}
