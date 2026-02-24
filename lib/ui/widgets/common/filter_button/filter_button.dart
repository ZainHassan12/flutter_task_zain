import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:flutter_task_zain/ui/widgets/common/filter_button/filter_button_model.dart';
import 'package:stacked/stacked.dart';

class PackageFilterButtons extends StackedView<FilterButtonModel> {
  final int selectedIndex;
  final Function(int)? onTap;

  const PackageFilterButtons({
    super.key,
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget builder(
    BuildContext context,
    FilterButtonModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);

    final buttons = [
      buttonAll,
      buttonLocal,
      buttonRegional,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.pHuge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < buttons.length; i++) ...[
            if (i > 0) SizedBox(width: AppDimensions.pM),
            _buildButton(
              context,
              title: buttons[i],
              isSelected: selectedIndex == i,
              onTap: () => onTap?.call(i),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String title,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimensions.buttonHeight,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.pXL),
        decoration: BoxDecoration(
          color: isSelected ? accentBlue : white,
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          border: Border.all(
            color: accentBlue,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.buttonTextBold.copyWith(
            color: isSelected ? white : accentBlue,
          ),
        ),
      ),
    );
  }

  @override
  FilterButtonModel viewModelBuilder(BuildContext context) =>
      FilterButtonModel();
}
