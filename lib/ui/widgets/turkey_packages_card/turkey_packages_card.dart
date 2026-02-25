import 'package:flutter/material.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';

class TurkeyPackageCard extends StatelessWidget {
  final TurkeyPackageModel package;
  final VoidCallback? onTap;
  final bool isSelected;

  const TurkeyPackageCard({
    super.key,
    required this.package,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardInner = Container(
      padding: EdgeInsets.all(AppDimensions.pM),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(
          isSelected
              ? AppDimensions.itemCardRadius - 1.5
              : AppDimensions.itemCardRadius,
        ),
        border: isSelected
            ? null
            : Border.all(color: cardTitleBackground, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Container(
              height: AppDimensions.h(28),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.w(8),
                vertical: AppDimensions.h(2),
              ),
              decoration: BoxDecoration(
                color: cardTitleBackground,
                borderRadius: BorderRadius.circular(AppDimensions.rRound),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "${package.data} $gbUnit",
                style: AppTextStyles.cardTitle,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "Valid for:",
                style: AppTextStyles.validFor,
              ),
              SizedBox(height: AppDimensions.pXS),
              Text(
                "${package.validityDays} $daysUnit",
                style: AppTextStyles.validForDays,
              ),
            ],
          ),
          const Divider(color: borderGrey),
          Row(
            children: [
              Text(
                "$currencySymbol ",
                style: AppTextStyles.priceRegular,
              ),
              Text(
                "${package.price}",
                style: AppTextStyles.priceBold,
              ),
            ],
          ),
        ],
      ),
    );

    if (isSelected) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                accentBlue,
                greenBorder,
              ],
            ),
            borderRadius: BorderRadius.circular(AppDimensions.itemCardRadius),
          ),
          padding: const EdgeInsets.all(1.5),
          child: cardInner,
        ),
      );
    }

    return GestureDetector(onTap: onTap, child: cardInner);
  }
}
