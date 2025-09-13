import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/mixer_vip_subscription_model.dart';

class FeatureItemWidget extends StatelessWidget {
  final VipFeatureModel feature;

  const FeatureItemWidget({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: feature.iconPath ?? '',
          height: 20.h,
          width: 20.h,
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: Text(
            feature.title ?? '',
            style: TextStyleHelper.instance.body14MediumManrope
                .copyWith(color: appTheme.gray_800, height: 1.43),
          ),
        ),
      ],
    );
  }
}
