import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/common/app_dimensions.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:flutter_task_zain/ui/common/app_styles.dart';

class NeedSupport extends StatelessWidget {
  const NeedSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.pHuge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            contactPrefix,
            style: AppTextStyles.supportedRegular,
          ),
          SizedBox(width: AppDimensions.pS),
          Image.asset(
            whatsappIcon,
            width: AppDimensions.w(24),
            height: AppDimensions.h(24),
          ),
          SizedBox(width: AppDimensions.pXS),
          Text(
            whatsapp,
            style: AppTextStyles.contactBold,
          ),
        ],
      ),
    );
  }
}
