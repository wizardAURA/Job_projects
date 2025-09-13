import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/feature_model.dart';

class FeatureItemWidget extends StatelessWidget {
  final FeatureModel? featureModel;

  const FeatureItemWidget({
    Key? key,
    this.featureModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: featureModel?.iconPath ?? '',
          height: 20.h,
          width: 20.h,
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: Text(
            featureModel?.title ?? '',
            style: TextStyleHelper.instance.body14MediumManrope
                .copyWith(color: appTheme.gray_800, height: 1.43),
          ),
        ),
      ],
    );
  }
}
