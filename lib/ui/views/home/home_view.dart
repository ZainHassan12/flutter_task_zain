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

              // Search
              const CustomSearchBar(),
              SizedBox(height: AppDimensions.h(16)),

              // Country Badge
              const CountryBadge(),
              SizedBox(height: AppDimensions.h(16)),

              // Filter Buttons
              const PackageFilterButtons(),
              SizedBox(height: AppDimensions.h(16)),

              // Turkey Section
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.pHuge,
                  right: AppDimensions.pHuge,
                ),
                child: Text(
                  titleCountry,
                  style: AppTextStyles.sectionTitle,
                ),
              ),
              SizedBox(height: AppDimensions.pM),

              // Turkey Packages Grid
              TurkeyPackagesGrid(
                packages: viewModel.turkeyPackages,
                cartItems: viewModel.cartItems,
                onPackageTap: (package) =>
                    viewModel.onTurkeyPackageTap(package),
              ),
              SizedBox(
                  height: AppDimensions.h(
                      24)), // Slightly more space between sections

              // Global Section
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.pHuge,
                  right: AppDimensions.pHuge,
                ),
                child: Text(
                  titleGlobal,
                  style: AppTextStyles.sectionTitle,
                ),
              ),
              SizedBox(height: AppDimensions.pM),

              // 🔥 ADD THIS - Global Packages Grid
              GlobalPackagesGrid(
                packages: viewModel.globalPackages,
                cartItems: viewModel.cartItems,
                onTap: (package) => viewModel.onGlobalPackageTap(package),
              ),

              // Bottom padding
              SizedBox(height: AppDimensions.h(24)),

              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.pHuge,
                  right: AppDimensions.pHuge,
                ),
                child: Text(
                  "Need Support?",
                  style: AppTextStyles.sectionTitle,
                ),
              ),
              const NeedSupport(),
              SizedBox(height: AppDimensions.h(24)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
