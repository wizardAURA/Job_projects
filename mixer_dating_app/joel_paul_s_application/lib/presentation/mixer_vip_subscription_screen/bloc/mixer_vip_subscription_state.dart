part of 'mixer_vip_subscription_bloc.dart';

class MixerVipSubscriptionState extends Equatable {
  final MixerVipSubscriptionModel? mixerVipSubscriptionModel;
  final bool isLoading;
  final bool isSubscriptionSuccess;

  const MixerVipSubscriptionState({
    this.mixerVipSubscriptionModel,
    this.isLoading = false,
    this.isSubscriptionSuccess = false,
  });

  @override
  List<Object?> get props => [
        mixerVipSubscriptionModel,
        isLoading,
        isSubscriptionSuccess,
      ];

  MixerVipSubscriptionState copyWith({
    MixerVipSubscriptionModel? mixerVipSubscriptionModel,
    bool? isLoading,
    bool? isSubscriptionSuccess,
  }) {
    return MixerVipSubscriptionState(
      mixerVipSubscriptionModel:
          mixerVipSubscriptionModel ?? this.mixerVipSubscriptionModel,
      isLoading: isLoading ?? this.isLoading,
      isSubscriptionSuccess:
          isSubscriptionSuccess ?? this.isSubscriptionSuccess,
    );
  }
}
