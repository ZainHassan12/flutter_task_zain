// import 'package:flutter/material.dart';
// import '../../common/app_colors.dart';
// import '../../common/app_dimensions.dart';
// import '../../common/app_strings.dart';
// import '../../common/app_styles.dart';

// class CustomSearchBar extends StatelessWidget {
//   final TextEditingController? controller;
//   final VoidCallback? onTap;

//   const CustomSearchBar({
//     super.key,
//     this.controller,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     AppDimensions.init(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppDimensions.pHuge,
//       ),
//       child: Container(
//         height: AppDimensions.searchBarHeight,
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: BorderRadius.circular(AppDimensions.searchBarRadius),
//           border: Border.all(
//             color: borderLight,
//             width: 1,
//           ),
//         ),
//         child: TextField(
//           controller: controller,
//           onTap: onTap,
//           style: AppTextStyles.searchText.copyWith(
//             color: textPrimary,
//           ),
//           decoration: InputDecoration(
//             hintText: searchHint,
//             hintStyle: AppTextStyles.searchText,
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: AppDimensions.pM,
//             ),
//             prefixIcon: Padding(
//               padding: EdgeInsets.all(AppDimensions.pM),
//               child: Icon(
//                 Icons.search,
//                 size: 20,
//                 color: textGrey,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
