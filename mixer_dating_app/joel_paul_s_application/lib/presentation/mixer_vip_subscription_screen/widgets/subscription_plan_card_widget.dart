import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../bloc/mixer_vip_subscription_bloc.dart';
import '../models/mixer_vip_subscription_model.dart';

class SubscriptionPlanCardWidget extends StatelessWidget {
  final SubscriptionPlanModel plan;
  final bool isVip;

  const SubscriptionPlanCardWidget({
    Key? key,
    required this.plan,
    this.isVip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MixerVipSubscriptionBloc>().add(
              PlanSelectionEvent(isBasicPlan: !isVip),
            );
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: isVip ? Color(0xFFFDF9F5) : appTheme.transparentCustom,
          border: Border.all(
            color: isVip ? Color(0xFFFFE4BE) : appTheme.blue_gray_100_4f,
          ),
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4.h,
                      children: [
                        Text(
                          plan.title ?? '',
                          style: TextStyleHelper.instance.title16MediumSFPro
                              .copyWith(height: 1.25),
                        ),
                        Text(
                          plan.price ?? '',
                          style: TextStyleHelper.instance.headline26BoldSFPro
                              .copyWith(
                                  color: isVip
                                      ? Color(0xFFA16000)
                                      : appTheme.pink_900,
                                  height: 1.23),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: plan.iconPath ?? '',
                  height: isVip ? 36.h : 34.h,
                  width: isVip ? 36.h : 34.h,
                ),
              ],
            ),
            SizedBox(height: isVip ? 18.h : 28.h),
            Padding(
              padding: EdgeInsets.only(left: 1.h, bottom: 8.h),
              child: SizedBox(
                width: isVip ? double.infinity : null,
                child: Text(
                  plan.description ?? '',
                  style: TextStyleHelper.instance.body14MediumManrope.copyWith(
                      color: appTheme.gray_800, height: isVip ? 1.57 : 1.43),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
