part of 'mixer_subscription_bloc.dart';

abstract class MixerSubscriptionEvent extends Equatable {
  const MixerSubscriptionEvent();

  @override
  List<Object?> get props => [];
}

class MixerSubscriptionInitialEvent extends MixerSubscriptionEvent {}

class ShareButtonPressedEvent extends MixerSubscriptionEvent {}

class BasicPlanSelectedEvent extends MixerSubscriptionEvent {}

class VipPlanSelectedEvent extends MixerSubscriptionEvent {}

class ContinueButtonPressedEvent extends MixerSubscriptionEvent {}
