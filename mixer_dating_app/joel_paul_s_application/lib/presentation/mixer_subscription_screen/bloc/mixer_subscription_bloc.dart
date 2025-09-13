import '../../../core/app_export.dart';
import '../models/feature_model.dart';
import '../models/mixer_subscription_model.dart';

part 'mixer_subscription_event.dart';
part 'mixer_subscription_state.dart';

class MixerSubscriptionBloc
    extends Bloc<MixerSubscriptionEvent, MixerSubscriptionState> {
  MixerSubscriptionBloc(MixerSubscriptionState initialState)
      : super(initialState) {
    on<MixerSubscriptionInitialEvent>(_onInitialize);
    on<ShareButtonPressedEvent>(_onShareButtonPressed);
    on<BasicPlanSelectedEvent>(_onBasicPlanSelected);
    on<VipPlanSelectedEvent>(_onVipPlanSelected);
    on<ContinueButtonPressedEvent>(_onContinueButtonPressed);
  }

  _onInitialize(
    MixerSubscriptionInitialEvent event,
    Emitter<MixerSubscriptionState> emit,
  ) async {
    final basicPlan = PlanModel(
      title: 'Mixer',
      price: '\$24.99',
      description: 'All of the below',
      iconPath: ImageConstant.imgGroup13962,
      isSelected: true,
    );

    final vipPlan = PlanModel(
      title: 'Mixer VIP',
      price: '\$99.99',
      description: 'All 3 + VIP seating, food, and beverages',
      iconPath: ImageConstant.imgGroup13962,
      isSelected: false,
    );

    final features = [
      FeatureModel(
        iconPath: ImageConstant.img28SharePink900,
        title: 'Unlimited Likes',
      ),
      FeatureModel(
        iconPath: ImageConstant.img28SharePink900,
        title: 'See who liked you',
      ),
      FeatureModel(
        iconPath: ImageConstant.img28SharePink900,
        title: 'Find people with wide range',
      ),
      FeatureModel(
        iconPath: ImageConstant.img28SharePink900,
        title: 'Access to events',
      ),
    ];

    emit(state.copyWith(
      mixerSubscriptionModel: state.mixerSubscriptionModel?.copyWith(
        basicPlan: basicPlan,
        vipPlan: vipPlan,
        features: features,
      ),
    ));
  }

  _onShareButtonPressed(
    ShareButtonPressedEvent event,
    Emitter<MixerSubscriptionState> emit,
  ) async {
    // Handle share functionality
  }

  _onBasicPlanSelected(
    BasicPlanSelectedEvent event,
    Emitter<MixerSubscriptionState> emit,
  ) async {
    final updatedBasicPlan =
        state.mixerSubscriptionModel?.basicPlan?.copyWith(isSelected: true);
    final updatedVipPlan =
        state.mixerSubscriptionModel?.vipPlan?.copyWith(isSelected: false);

    emit(state.copyWith(
      mixerSubscriptionModel: state.mixerSubscriptionModel?.copyWith(
        basicPlan: updatedBasicPlan,
        vipPlan: updatedVipPlan,
      ),
    ));
  }

  _onVipPlanSelected(
    VipPlanSelectedEvent event,
    Emitter<MixerSubscriptionState> emit,
  ) async {
    final updatedBasicPlan =
        state.mixerSubscriptionModel?.basicPlan?.copyWith(isSelected: false);
    final updatedVipPlan =
        state.mixerSubscriptionModel?.vipPlan?.copyWith(isSelected: true);

    emit(state.copyWith(
      mixerSubscriptionModel: state.mixerSubscriptionModel?.copyWith(
        basicPlan: updatedBasicPlan,
        vipPlan: updatedVipPlan,
      ),
    ));
  }

  _onContinueButtonPressed(
    ContinueButtonPressedEvent event,
    Emitter<MixerSubscriptionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Simulate payment processing
    await Future.delayed(Duration(seconds: 1));

    emit(state.copyWith(
      isLoading: false,
      isSuccess: true,
    ));
  }
}
