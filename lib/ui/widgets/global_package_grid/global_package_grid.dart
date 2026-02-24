import 'package:flutter/material.dart';
import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/widgets/global_package_card/global_package_card.dart';

class GlobalPackagesGrid extends StatelessWidget {
  final List<GlobalPackageModel> packages;
  final Function(GlobalPackageModel) onTap;
  final List<dynamic> cartItems;

  const GlobalPackagesGrid({
    super.key,
    required this.packages,
    required this.onTap,
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
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          // ✅ Use mainAxisExtent for fixed pixel height instead of ratio
          // Global cards have more content so need more height
          mainAxisExtent: AppDimensions.h(170),
        ),
        itemBuilder: (context, index) {
          final package = packages[index];
          final isSelected = cartItems.any((item) => item.id == package.id);
          return GlobalPackageCard(
            package: package,
            isSelected: isSelected,
            onTap: () => onTap(package),
          );
        },
      ),
    );
  }
}
