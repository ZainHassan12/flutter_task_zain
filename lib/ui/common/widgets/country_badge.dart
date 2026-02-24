// import 'package:flutter/material.dart';
// import 'package:flutter_task_zain/ui/common/app_strings.dart';
// import '../../common/app_colors.dart';
// import '../../common/app_dimensions.dart';
// import '../../common/app_styles.dart';

// class CountryBadge extends StatelessWidget {
//   final VoidCallback? onRemove;

//   const CountryBadge({
//     super.key,
//     this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     AppDimensions.init(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppDimensions.pHuge,
//       ),
//       child: Container(
//         height: AppDimensions.countryContainerHeight,
//         padding: EdgeInsets.symmetric(
//           horizontal: AppDimensions.pM,
//         ),
//         decoration: BoxDecoration(
//           color: cardBackground,
//           borderRadius:
//               BorderRadius.circular(AppDimensions.countryContainerRadius),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             /// 🇹🇷 Flag
//             Image.asset(
//               flagTurkey,
//               width: AppDimensions.flagSize,
//               height: AppDimensions.flagSize,
//               fit: BoxFit.cover,
//             ),

//             SizedBox(width: AppDimensions.pM),

//             /// Country Name
//             Text(
//               appTitle,
//               style: AppTextStyles.countryName,
//             ),

//             SizedBox(width: AppDimensions.pM),

//             /// ❌ Cross Icon
//             GestureDetector(
//               onTap: onRemove,
//               child: SizedBox(
//                 width: AppDimensions.w(16),
//                 height: AppDimensions.h(16),
//                 child: const Icon(
//                   Icons.close,
//                   size: 16,
//                   color: textPrimary,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
