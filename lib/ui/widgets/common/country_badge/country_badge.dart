import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'country_badge_model.dart';

class CountryBadge extends StackedView<CountryBadgeModel> {
  final VoidCallback? onRemove;

  const CountryBadge({
    super.key,
    this.onRemove,
  });

  @override
  Widget builder(
    BuildContext context,
    CountryBadgeModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);

    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.pHuge, // Only left padding to align left
      ),
      child: Container(
        height: AppDimensions.countryContainerHeight,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.pM,
        ),
        decoration: BoxDecoration(
          color: cardTitleBackground,
          borderRadius:
              BorderRadius.circular(AppDimensions.countryContainerRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🇹🇷 Flag
            Image.asset(
              flagTurkey,
              width: AppDimensions.flagSize,
              height: AppDimensions.flagSize,
              fit: BoxFit.cover,
            ),

            SizedBox(width: AppDimensions.pM),

            /// Country Name
            Text(
              appTitle,
              style: AppTextStyles.countryName,
            ),

            SizedBox(width: AppDimensions.pM),

            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: AppDimensions.w(16),
                height: AppDimensions.h(16),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CountryBadgeModel viewModelBuilder(BuildContext context) =>
      CountryBadgeModel();
}
