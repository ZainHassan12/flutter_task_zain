import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_colors.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';
import 'package:flutter_task_zain/ui/widgets/common/app_bar/app_bar.dart';
import 'package:flutter_task_zain/ui/widgets/common/country_badge/country_badge.dart';
import 'package:flutter_task_zain/ui/widgets/common/filter_button/filter_button.dart';
import 'package:flutter_task_zain/ui/widgets/common/need_support/need_support.dart';
import 'package:flutter_task_zain/ui/widgets/common/search_bar/search_bar.dart';
import 'package:flutter_task_zain/ui/widgets/global_package_grid/global_package_grid.dart';
import 'package:flutter_task_zain/ui/widgets/turkey_packages_grid/turkey_packages_grid.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);
    return Scaffold(
      body: Container(
        color: white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              const CustomAppBar(),
              SizedBox(height: AppDimensions.h(16)),

              const CustomSearchBar(),
              SizedBox(height: AppDimensions.h(16)),

              // Country Badge
              const CountryBadge(),
              SizedBox(height: AppDimensions.h(16)),

              // Filter Buttons
              PackageFilterButtons(
                selectedIndex: viewModel.selectedFilterIndex,
                onTap: (index) => viewModel.onFilterChanged(index),
              ),
              SizedBox(height: AppDimensions.h(16)),

              // Turkey Section
              if (viewModel.turkeyPackages.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimensions.pHuge,
                    right: AppDimensions.pHuge,
                  ),
                  child: Text(
                    titleTurkey,
                    style: AppTextStyles.sectionTitle,
                  ),
                ),
                SizedBox(height: AppDimensions.pM),
                TurkeyPackagesGrid(
                  packages: viewModel.turkeyPackages,
                  cartItems: viewModel.cartItems,
                  onPackageTap: (package) =>
                      viewModel.onTurkeyPackageTap(package),
                ),
                SizedBox(height: AppDimensions.h(24)),
              ],

              // Global Section
              if (viewModel.globalPackages.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimensions.pHuge,
                  ),
                  child: Text(
                    titleGlobal,
                    style: AppTextStyles.sectionTitle,
                  ),
                ),
                SizedBox(height: AppDimensions.pM),
                GlobalPackagesGrid(
                  packages: viewModel.globalPackages,
                  cartItems: viewModel.cartItems,
                  onTap: (package) => viewModel.onGlobalPackageTap(package),
                ),
                SizedBox(height: AppDimensions.h(24)),
              ],

              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.pHuge,
                ),
                child: Text(
                  "Need Support?",
                  style: AppTextStyles.sectionTitle,
                ),
              ),
              const NeedSupport(),
              SizedBox(
                  height:
                      AppDimensions.h(30) + AppDimensions.bottomSheetHeight),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
