import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/mixer_subscription_model.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanModel? planModel;
  final VoidCallback? onTap;

  const PlanCardWidget({
    Key? key,
    this.planModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBasicPlan = planModel?.title == 'Mixer';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: isBasicPlan ? Color(0xFFFFFCFD) : appTheme.white_A700,
          border: Border.all(
            color: isBasicPlan
                ? Color(0xFF4FB301).withAlpha(0x42)
                : appTheme.gray_200,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Column(
          spacing: isBasicPlan ? 28.h : 18.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 6.h),
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          planModel?.title ?? '',
                          style: TextStyleHelper.instance.title16MediumSFPro
                              .copyWith(height: 1.25),
                        ),
                        Text(
                          planModel?.price ?? '',
                          style: TextStyleHelper.instance.headline26BoldSFPro
                              .copyWith(
                                  color: isBasicPlan
                                      ? Color(0xFF5E1053)
                                      : appTheme.lime_900,
                                  height: 1.23),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: planModel?.iconPath ?? '',
                  height: isBasicPlan ? 34.h : 36.h,
                  width: isBasicPlan ? 34.h : 36.h,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: isBasicPlan ? 8.h : 0),
              child: Text(
                planModel?.description ?? '',
                style: TextStyleHelper.instance.body14MediumManrope.copyWith(
                    color: appTheme.gray_800,
                    height: isBasicPlan ? 1.43 : 1.57),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
