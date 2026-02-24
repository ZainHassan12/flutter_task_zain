// import 'package:flutter/material.dart';
// import '../../common/app_colors.dart';
// import '../../common/app_dimensions.dart';
// import '../../common/app_strings.dart';
// import '../../common/app_styles.dart';

// class PackageFilterButtons extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int)? onTap;

//   const PackageFilterButtons({
//     super.key,
//     this.selectedIndex = 0,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     AppDimensions.init(context);

//     final buttons = [
//       buttonAll,
//       buttonLocal,
//       buttonRegional,
//     ];

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppDimensions.pHuge),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           for (int i = 0; i < buttons.length; i++) ...[
//             if (i > 0)
//               SizedBox(
//                   width: AppDimensions
//                       .pM), // 8px gap before each button except first
//             _buildButton(
//               context,
//               title: buttons[i],
//               isSelected: selectedIndex == i,
//               onTap: () => onTap?.call(i),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(
//     BuildContext context, {
//     required String title,
//     required bool isSelected,
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: AppDimensions.buttonHeight,
//         padding: EdgeInsets.symmetric(horizontal: AppDimensions.pXL),
//         decoration: BoxDecoration(
//           color: isSelected ? accentBlue : white,
//           borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
//           border: Border.all(
//             color: accentBlue,
//             width: 1,
//           ),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           title,
//           style: AppTextStyles.buttonTextBold.copyWith(
//             color: isSelected ? white : accentBlue,
//           ),
//         ),
//       ),
//     );
//   }
// }
