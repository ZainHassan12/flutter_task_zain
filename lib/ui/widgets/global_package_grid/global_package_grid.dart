import 'package:flutter/material.dart';
import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/widgets/global_package_card/global_package_card.dart';

class GlobalPackagesGrid extends StatelessWidget {
  final List<GlobalPackageModel> packages;
  final Function(GlobalPackageModel) onTap;
  final List<dynamic> cartItems; // ✅ To check which cards are selected

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
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
