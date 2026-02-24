import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:flutter_task_zain/ui/widgets/common/search_bar/search_bar_model.dart';
import 'package:stacked/stacked.dart';

class CustomSearchBar extends StackedView<CustomSearchBarModel> {
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomSearchBarModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.pHuge,
      ),
      child: Container(
        height: AppDimensions.searchBarHeight,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(AppDimensions.searchBarRadius),
          border: Border.all(
            color: borderLight,
            width: 1,
          ),
        ),
        child: TextField(
          controller: controller,
          onTap: onTap,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          style: AppTextStyles.searchText.copyWith(
            color: textPrimary,
          ),
          decoration: InputDecoration(
            hintText: searchHint,
            hintStyle: AppTextStyles.searchText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppDimensions.pM,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(AppDimensions.pM),
              child: Icon(
                Icons.search,
                size: 20,
                color: textGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CustomSearchBarModel viewModelBuilder(BuildContext context) =>
      CustomSearchBarModel();
}
