import '../../../core/app_export.dart';

class FeatureModel extends Equatable {
  String? iconPath;
  String? title;

  FeatureModel({
    this.iconPath,
    this.title,
  });

  FeatureModel copyWith({
    String? iconPath,
    String? title,
  }) {
    return FeatureModel(
      iconPath: iconPath ?? this.iconPath,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [iconPath, title];
}
