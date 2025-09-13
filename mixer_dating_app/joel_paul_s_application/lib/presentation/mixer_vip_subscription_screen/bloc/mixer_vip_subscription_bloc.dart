import '../../../core/app_export.dart';
import '../models/mixer_vip_subscription_model.dart';

part 'mixer_vip_subscription_event.dart';
part 'mixer_vip_subscription_state.dart';

class MixerVipSubscriptionBloc
    extends Bloc<MixerVipSubscriptionEvent, MixerVipSubscriptionState> {
  MixerVipSubscriptionBloc(MixerVipSubscriptionState initialState)
      : super(initialState) {
    on<MixerVipSubscriptionInitialEvent>(_onInitialize);
    on<ContinueButtonPressedEvent>(_onContinueButtonPressed);
    on<PlanSelectionEvent>(_onPlanSelection);
  }

  _onInitialize(
    MixerVipSubscriptionInitialEvent event,
    Emitter<MixerVipSubscriptionState> emit,
  ) async {
    emit(state.copyWith(
      mixerVipSubscriptionModel: MixerVipSubscriptionModel(
        basicPlan: SubscriptionPlanModel(
          title: 'Mixer',
          price: '\$24.99',
          description: 'All of the below',
          iconPath: ImageConstant.imgGroup13962,
          isSelected: false,
        ),
        vipPlan: SubscriptionPlanModel(
          title: 'Mixer VIP',
          price: '\$99.99',
          description: 'Mixer + VIP seating, food & beverages',
          iconPath: ImageConstant.imgGroup13962,
          isSelected: true,
        ),
        vipFeatures: [
          VipFeatureModel(
            iconPath: ImageConstant.img28ShareOrange800,
            title: 'Unlimited Likes',
          ),
          VipFeatureModel(
            iconPath: ImageConstant.img28ShareOrange800,
            title: 'See who liked you',
          ),
          VipFeatureModel(
            iconPath: ImageConstant.img28ShareOrange800,
            title: 'Find people with wide range',
          ),
          VipFeatureModel(
            iconPath: ImageConstant.img28ShareOrange800,
            title: 'Access to events',
          ),
          VipFeatureModel(
            iconPath: ImageConstant.img28ShareOrange800,
            title: 'VIP seating, food & beverages',
          ),
        ],
      ),
      isLoading: false,
    ));
  }

  _onContinueButtonPressed(
    ContinueButtonPressedEvent event,
    Emitter<MixerVipSubscriptionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Simulate subscription process
    await Future.delayed(Duration(seconds: 2));

    emit(state.copyWith(
      isLoading: false,
      isSubscriptionSuccess: true,
    ));
  }

  _onPlanSelection(
    PlanSelectionEvent event,
    Emitter<MixerVipSubscriptionState> emit,
  ) async {
    MixerVipSubscriptionModel? updatedModel =
        state.mixerVipSubscriptionModel?.copyWith(
      basicPlan: state.mixerVipSubscriptionModel?.basicPlan?.copyWith(
        isSelected: event.isBasicPlan,
      ),
      vipPlan: state.mixerVipSubscriptionModel?.vipPlan?.copyWith(
        isSelected: !event.isBasicPlan,
      ),
    );

    emit(state.copyWith(mixerVipSubscriptionModel: updatedModel));
  }
}
