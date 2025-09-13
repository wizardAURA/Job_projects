import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import './bloc/mixer_vip_subscription_bloc.dart';
import './models/mixer_vip_subscription_model.dart';
import './widgets/feature_item_widget.dart';
import './widgets/subscription_plan_card_widget.dart';

class MixerVipSubscriptionScreen extends StatelessWidget {
  const MixerVipSubscriptionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MixerVipSubscriptionBloc>(
      create: (context) => MixerVipSubscriptionBloc(
        MixerVipSubscriptionState(
          mixerVipSubscriptionModel: MixerVipSubscriptionModel(),
        ),
      )..add(MixerVipSubscriptionInitialEvent()),
      child: MixerVipSubscriptionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MixerVipSubscriptionBloc, MixerVipSubscriptionState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildHeaderSection(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      spacing: 36.h,
                      children: [
                        _buildSubscriptionPlansSection(context, state),
                        _buildVipFeaturesSection(context, state),
                        _buildContinueSection(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF3E3), Color(0xFFFFFFFF)],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'Mixer',
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.img28Share,
                  height: 24.h,
                  width: 24.h,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h, top: 26.h),
            child: Text(
              'Level Up Your Mixer Experience',
              style: TextStyleHelper.instance.title20ExtraBoldManrope
                  .copyWith(color: appTheme.gray_900_01, height: 1.4),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h, top: 44.h),
            child: Text(
              'Select a plan',
              style: TextStyleHelper.instance.title16MediumManrope
                  .copyWith(height: 1.375),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlansSection(
      BuildContext context, MixerVipSubscriptionState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        spacing: 16.h,
        children: [
          Expanded(
            child: SubscriptionPlanCardWidget(
              plan: state.mixerVipSubscriptionModel?.basicPlan ??
                  SubscriptionPlanModel(),
            ),
          ),
          Expanded(
            child: SubscriptionPlanCardWidget(
              plan: state.mixerVipSubscriptionModel?.vipPlan ??
                  SubscriptionPlanModel(),
              isVip: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVipFeaturesSection(
      BuildContext context, MixerVipSubscriptionState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Container(
        width: double.infinity,
        height: 244.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.all(18.h),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.orange_100),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Column(
                spacing: 16.h,
                children: [
                  SizedBox(height: 6.h),
                  ...List.generate(
                    state.mixerVipSubscriptionModel?.vipFeatures?.length ?? 0,
                    (index) => FeatureItemWidget(
                      feature: state
                              .mixerVipSubscriptionModel?.vipFeatures?[index] ??
                          VipFeatureModel(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.h),
                decoration: BoxDecoration(
                  color: appTheme.gray_50_01,
                  border: Border.all(color: appTheme.orange_100),
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Text(
                  'Included with Mixer VIP',
                  style: TextStyleHelper.instance.body12SemiBoldManrope
                      .copyWith(height: 1.42),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 1.h),
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<MixerVipSubscriptionBloc>()
                    .add(ContinueButtonPressedEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.transparentCustom,
                shadowColor: appTheme.transparentCustom,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.h),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.1, -1.0),
                    end: Alignment(-0.1, 1.0),
                    colors: [Color(0xFFA96E18), Color(0xFFD59331)],
                  ),
                  borderRadius: BorderRadius.circular(24.h),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage868,
                      height: 22.h,
                      width: 26.h,
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      'Continue – \$99.99 total',
                      style: TextStyleHelper.instance.title16SemiBoldManrope
                          .copyWith(height: 1.375),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
              textAlign: TextAlign.center,
              style: TextStyleHelper.instance.label10LightManrope
                  .copyWith(height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}
