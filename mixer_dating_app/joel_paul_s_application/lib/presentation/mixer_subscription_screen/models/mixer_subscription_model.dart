import '../../../core/app_export.dart';
import './feature_model.dart';

class MixerSubscriptionModel extends Equatable {
  PlanModel? basicPlan;
  PlanModel? vipPlan;
  List<FeatureModel>? features;

  MixerSubscriptionModel({
    this.basicPlan,
    this.vipPlan,
    this.features,
  });

  MixerSubscriptionModel copyWith({
    PlanModel? basicPlan,
    PlanModel? vipPlan,
    List<FeatureModel>? features,
  }) {
    return MixerSubscriptionModel(
      basicPlan: basicPlan ?? this.basicPlan,
      vipPlan: vipPlan ?? this.vipPlan,
      features: features ?? this.features,
    );
  }

  @override
  List<Object?> get props => [basicPlan, vipPlan, features];
}

class PlanModel extends Equatable {
  String? title;
  String? price;
  String? description;
  String? iconPath;
  bool? isSelected;

  PlanModel({
    this.title,
    this.price,
    this.description,
    this.iconPath,
    this.isSelected,
  }) {
    isSelected = isSelected ?? false;
  }

  PlanModel copyWith({
    String? title,
    String? price,
    String? description,
    String? iconPath,
    bool? isSelected,
  }) {
    return PlanModel(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [title, price, description, iconPath, isSelected];
}
