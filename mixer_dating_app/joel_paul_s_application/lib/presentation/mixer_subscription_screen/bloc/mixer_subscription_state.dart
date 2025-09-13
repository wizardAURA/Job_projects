part of 'mixer_subscription_bloc.dart';

class MixerSubscriptionState extends Equatable {
  final MixerSubscriptionModel? mixerSubscriptionModel;
  final bool isLoading;
  final bool isSuccess;

  const MixerSubscriptionState({
    this.mixerSubscriptionModel,
    this.isLoading = false,
    this.isSuccess = false,
  });

  @override
  List<Object?> get props => [
        mixerSubscriptionModel,
        isLoading,
        isSuccess,
      ];

  MixerSubscriptionState copyWith({
    MixerSubscriptionModel? mixerSubscriptionModel,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return MixerSubscriptionState(
      mixerSubscriptionModel:
          mixerSubscriptionModel ?? this.mixerSubscriptionModel,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
