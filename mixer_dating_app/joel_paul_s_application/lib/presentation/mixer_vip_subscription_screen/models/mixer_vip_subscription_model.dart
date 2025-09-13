import '../../../core/app_export.dart';

class MixerVipSubscriptionModel extends Equatable {
  SubscriptionPlanModel? basicPlan;
  SubscriptionPlanModel? vipPlan;
  List<VipFeatureModel>? vipFeatures;

  MixerVipSubscriptionModel({
    this.basicPlan,
    this.vipPlan,
    this.vipFeatures,
  }) {
    basicPlan = basicPlan ?? SubscriptionPlanModel();
    vipPlan = vipPlan ?? SubscriptionPlanModel();
    vipFeatures = vipFeatures ?? [];
  }

  MixerVipSubscriptionModel copyWith({
    SubscriptionPlanModel? basicPlan,
    SubscriptionPlanModel? vipPlan,
    List<VipFeatureModel>? vipFeatures,
  }) {
    return MixerVipSubscriptionModel(
      basicPlan: basicPlan ?? this.basicPlan,
      vipPlan: vipPlan ?? this.vipPlan,
      vipFeatures: vipFeatures ?? this.vipFeatures,
    );
  }

  @override
  List<Object?> get props => [basicPlan, vipPlan, vipFeatures];
}

class SubscriptionPlanModel extends Equatable {
  String? title;
  String? price;
  String? description;
  String? iconPath;
  bool? isSelected;

  SubscriptionPlanModel({
    this.title,
    this.price,
    this.description,
    this.iconPath,
    this.isSelected,
  }) {
    title = title ?? '';
    price = price ?? '';
    description = description ?? '';
    iconPath = iconPath ?? '';
    isSelected = isSelected ?? false;
  }

  SubscriptionPlanModel copyWith({
    String? title,
    String? price,
    String? description,
    String? iconPath,
    bool? isSelected,
  }) {
    return SubscriptionPlanModel(
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

class VipFeatureModel extends Equatable {
  String? iconPath;
  String? title;

  VipFeatureModel({
    this.iconPath,
    this.title,
  }) {
    iconPath = iconPath ?? '';
    title = title ?? '';
  }

  VipFeatureModel copyWith({
    String? iconPath,
    String? title,
  }) {
    return VipFeatureModel(
      iconPath: iconPath ?? this.iconPath,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [iconPath, title];
}
