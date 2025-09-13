import 'package:flutter/material.dart';
import '../presentation/mixer_subscription_screen/mixer_subscription_screen.dart';
import '../presentation/mixer_vip_subscription_screen/mixer_vip_subscription_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String mixerSubscriptionScreen = '/mixer_subscription_screen';
  static const String mixerVipSubscriptionScreen =
      '/mixer_vip_subscription_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        mixerSubscriptionScreen: MixerSubscriptionScreen.builder,
        mixerVipSubscriptionScreen: MixerVipSubscriptionScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
