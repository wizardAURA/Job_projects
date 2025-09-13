import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomAppBar - A reusable and customizable app bar component
 * 
 * This component provides a flexible app bar implementation that supports:
 * - Custom titles with consistent typography
 * - Optional leading widgets (back buttons, menu icons)
 * - Action buttons (share, menu, etc.)
 * - Consistent spacing and theming
 * - Responsive design across different screen sizes
 * 
 * @param title - The main title text to display in the app bar
 * @param actions - Optional list of action widgets to display on the right
 * @param leading - Optional leading widget to display on the left
 * @param backgroundColor - Background color of the app bar
 * @param foregroundColor - Color for text and icons
 * @param centerTitle - Whether to center the title text
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle,
  }) : super(key: key);

  /// The main title text to display in the app bar
  final String? title;

  /// Optional list of action widgets to display on the right
  final List<Widget>? actions;

  /// Optional leading widget to display on the left
  final Widget? leading;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Color for text and icons
  final Color? foregroundColor;

  /// Whether to center the title text
  final bool? centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      foregroundColor: foregroundColor ?? Color(0xFF22242B),
      centerTitle: centerTitle ?? false,
      leading: leading,
      title: title != null
          ? Text(
              title!,
              style: TextStyleHelper.instance.headline24BoldOnest.copyWith(
                  color: foregroundColor ?? Color(0xFF22242B), height: 31 / 24),
            )
          : null,
      actions: actions != null
          ? [
              ...actions!,
              SizedBox(width: 20.h),
            ]
          : null,
      titleSpacing: 20.h,
      leadingWidth: leading != null ? 56.h : null,
    );
  }
}
