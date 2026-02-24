import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:flutter_task_zain/ui/widgets/common/app_bar/app_bar_model.dart';
import 'package:stacked/stacked.dart';

class CustomAppBar extends StackedView<CustomAppBarModel> {
  final VoidCallback? onBackTap;
  final VoidCallback? onCartTap;

  const CustomAppBar({
    super.key,
    this.onBackTap,
    this.onCartTap,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomAppBarModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);

    return SizedBox(
      height: AppDimensions.appBarHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // 🔵 Background
          Container(
            height: AppDimensions.appBarHeight,
            width: double.infinity,
            color: primaryBlue,
          ),

          // 🟢 Ellipse (decorative)
          Positioned(
            top: AppDimensions.ellipseTop,
            left: AppDimensions.ellipseLeft,
            child: Container(
              width: AppDimensions.ellipseWidth,
              height: AppDimensions.ellipseHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    greenAccent.withOpacity(0.8),
                    greenAccent.withOpacity(0.5),
                    greenAccent.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // 🔹 AppBar Content Row
          Positioned(
            top: AppDimensions.appBarItemsTop,
            left: AppDimensions.appBarItemsLeft,
            right: AppDimensions.appBarItemsLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 🔙 Back Button
                GestureDetector(
                  onTap: onBackTap,
                  child: SizedBox(
                    width: AppDimensions.backButtonSize,
                    height: AppDimensions.backButtonSize,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: white,
                      size: 18,
                    ),
                  ),
                ),

                /// 🏷 Title
                Text(
                  appTitle,
                  style: AppTextStyles.appBarText,
                ),

                /// 🛒 Cart Button
                GestureDetector(
                  onTap: onCartTap,
                  child: SizedBox(
                    width: AppDimensions.cartButtonWidth,
                    height: AppDimensions.cartButtonHeight,
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CustomAppBarModel viewModelBuilder(BuildContext context) =>
      CustomAppBarModel();
}
