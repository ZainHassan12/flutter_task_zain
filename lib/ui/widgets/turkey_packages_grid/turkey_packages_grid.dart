import 'package:flutter/material.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/widgets/turkey_packages_card/turkey_packages_card.dart';

class TurkeyPackagesGrid extends StatelessWidget {
  final List<TurkeyPackageModel> packages;
  final Function(TurkeyPackageModel) onPackageTap;
  final List<dynamic> cartItems;

  const TurkeyPackagesGrid({
    super.key,
    required this.packages,
    required this.onPackageTap,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.pHuge),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: packages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          // ✅ Use mainAxisExtent for fixed pixel height instead of ratio
          // This prevents the grid from over-allocating vertical space
          mainAxisExtent: AppDimensions.h(130),
        ),
        itemBuilder: (context, index) {
          final package = packages[index];
          final isSelected = cartItems.any((item) => item.id == package.id);
          return TurkeyPackageCard(
            package: package,
            isSelected: isSelected,
            onTap: () => onPackageTap(package),
          );
        },
      ),
    );
  }
}
