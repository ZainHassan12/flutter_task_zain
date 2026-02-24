import 'package:flutter/material.dart';
import 'app_dimensions.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  /// Base Fonts
  static const _sfProBold = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.5,
  );

  static const _sfProMedium = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.5,
  );

  static const _sfProRegular = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  static const _mulishRegular = TextStyle(
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  /// App Bar
  static TextStyle get appBarText =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: white);

  // Search
  static TextStyle get searchText =>
      _mulishRegular.copyWith(fontSize: AppDimensions.sp(14), color: textGrey);

  // Country
  static TextStyle get countryName => _sfProRegular.copyWith(
      fontSize: AppDimensions.sp(14), color: textPrimary);

  // Buttons
  static TextStyle get buttonTextBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: textPrimary);

  static TextStyle get buttonTextRegular => _sfProRegular.copyWith(
      fontSize: AppDimensions.sp(16), color: textPrimary);

  // Section Title
  static TextStyle get sectionTitle =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: textPrimary);

  // Card
  static TextStyle get cardTitle =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: textPrimary);

  static TextStyle get validFor => _sfProRegular.copyWith(
        fontSize: AppDimensions.sp(12),
        color: textSecondary,
      );

  static TextStyle get validForDays => _sfProBold.copyWith(
        fontSize: AppDimensions.sp(12),
        color: textPrimary,
      );

  // Price
  static TextStyle get priceRegular =>
      _sfProRegular.copyWith(fontSize: AppDimensions.sp(16), color: accentBlue);

  static TextStyle get priceBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: accentBlue);

  // Bottom Sheet
  static TextStyle get bottomSheetAmount => _sfProRegular.copyWith(
      fontSize: AppDimensions.sp(15), color: textPrimary);

  static TextStyle get bottomSheetAmountBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(15), color: accentBlue);

  static TextStyle get bottomSheetDetails =>
      _sfProMedium.copyWith(fontSize: AppDimensions.sp(12), color: textGrey);

  static TextStyle get bottomSheetCounter =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(14), color: textSecondary);

  // Checkout
  static TextStyle get checkoutRegular =>
      _sfProRegular.copyWith(fontSize: AppDimensions.sp(14), color: white);

  static TextStyle get checkoutBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(14), color: white);

  static TextStyle get contactBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(14), color: greenAccent);

  // Supported
  static TextStyle get supportedRegular =>
      _sfProRegular.copyWith(fontSize: AppDimensions.sp(14), color: finalText);

  static TextStyle get supportedBold =>
      _sfProBold.copyWith(fontSize: AppDimensions.sp(16), color: textPrimary);
}
