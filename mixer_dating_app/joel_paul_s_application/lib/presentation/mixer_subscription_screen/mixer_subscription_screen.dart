import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import './bloc/mixer_subscription_bloc.dart';
import './models/mixer_subscription_model.dart';
import './widgets/feature_item_widget.dart';
import './widgets/plan_card_widget.dart';

class MixerSubscriptionScreen extends StatelessWidget {
  const MixerSubscriptionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MixerSubscriptionBloc>(
      create: (context) => MixerSubscriptionBloc(MixerSubscriptionState(
        mixerSubscriptionModel: MixerSubscriptionModel(),
      ))
        ..add(MixerSubscriptionInitialEvent()),
      child: const MixerSubscriptionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MixerSubscriptionBloc, MixerSubscriptionState>(
        listener: (context, state) {
          if (state.isSuccess) {
            NavigatorService.pushNamed(AppRoutes.mixerVipSubscriptionScreen);
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: appTheme.white_A700,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF59FF97).withAlpha(0xD1),
                        appTheme.color00FFFF,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        title: 'Mixer',
                        actions: [
                          IconButton(
                            onPressed: () {
                              context.read<MixerSubscriptionBloc>().add(
                                    ShareButtonPressedEvent(),
                                  );
                            },
                            icon: CustomImageView(
                              imagePath: ImageConstant.img28Share,
                              height: 24.h,
                              width: 24.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.h),
                        child: Text(
                          'Level Up Your Mixer Experience',
                          style: TextStyleHelper
                              .instance.title20ExtraBoldManrope
                              .copyWith(height: 1.4),
                        ),
                      ),
                      SizedBox(height: 44.h),
                      Container(
                        margin: EdgeInsets.only(left: 20.h),
                        child: Text(
                          'Select a plan',
                          style: TextStyleHelper.instance.title16MediumManrope
                              .copyWith(height: 1.375),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      spacing: 30.h,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            spacing: 16.h,
                            children: [
                              Expanded(
                                child: PlanCardWidget(
                                  planModel:
                                      state.mixerSubscriptionModel?.basicPlan,
                                  onTap: () {
                                    context.read<MixerSubscriptionBloc>().add(
                                          BasicPlanSelectedEvent(),
                                        );
                                  },
                                ),
                              ),
                              Expanded(
                                child: PlanCardWidget(
                                  planModel:
                                      state.mixerSubscriptionModel?.vipPlan,
                                  onTap: () {
                                    context.read<MixerSubscriptionBloc>().add(
                                          VipPlanSelectedEvent(),
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 14.h),
                                  padding: EdgeInsets.all(18.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: appTheme.pink_100,
                                      width: 1.h,
                                    ),
                                    borderRadius: BorderRadius.circular(8.h),
                                  ),
                                  child: Column(
                                    spacing: 16.h,
                                    children: [
                                      SizedBox(height: 6.h),
                                      ...state.mixerSubscriptionModel?.features
                                              ?.map((feature) =>
                                                  FeatureItemWidget(
                                                      featureModel: feature))
                                              .toList() ??
                                          [],
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.h,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appTheme.white_A700_01,
                                      border: Border.all(
                                        color: appTheme.pink_100,
                                        width: 1.h,
                                      ),
                                      borderRadius: BorderRadius.circular(12.h),
                                    ),
                                    child: Text(
                                      'Included with Mixer VIP',
                                      style: TextStyleHelper
                                          .instance.body12SemiBoldManrope
                                          .copyWith(height: 1.42),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.h),
                  child: Column(
                    spacing: 16.h,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<MixerSubscriptionBloc>().add(
                                ContinueButtonPressedEvent(),
                              );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.h,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.087, -0.996),
                              end: Alignment(-0.087, 0.996),
                              colors: [
                                Color(0xFFE40003),
                                appTheme.pink_900_01,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24.h),
                          ),
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
                                'Continue – \$24.99 total',
                                style: TextStyleHelper
                                    .instance.title16SemiBoldManrope
                                    .copyWith(height: 1.375),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        child: Text(
                          'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.instance.label10LightManrope
                              .copyWith(height: 1.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
