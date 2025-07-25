
import 'package:flutter/widgets.dart';

/// A model class for the items in the [BottomNavX].
class BottomNavItem {
  /// The icon of the item.
  final Widget icon;

  /// The title of the item.
  final String? title;

  /// The widget to display when the item is active.
  final Widget? activeIcon;

  /// The widget to display in the badge.
  final Widget? badge;

  /// Creates a new instance of [BottomNavItem].
  const BottomNavItem({
    required this.icon,
    this.title,
    this.activeIcon,
    this.badge,
  });
}
