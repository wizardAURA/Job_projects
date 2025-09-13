part of 'mixer_vip_subscription_bloc.dart';

abstract class MixerVipSubscriptionEvent extends Equatable {
  const MixerVipSubscriptionEvent();

  @override
  List<Object?> get props => [];
}

class MixerVipSubscriptionInitialEvent extends MixerVipSubscriptionEvent {}

class ContinueButtonPressedEvent extends MixerVipSubscriptionEvent {}

class PlanSelectionEvent extends MixerVipSubscriptionEvent {
  final bool isBasicPlan;

  const PlanSelectionEvent({required this.isBasicPlan});

  @override
  List<Object?> get props => [isBasicPlan];
}
