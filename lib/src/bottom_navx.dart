
import 'package:flutter/material.dart';
import 'package:flutter_navx/src/nav_controller.dart';
import 'package:flutter_navx/src/nav_item.dart';

/// A lightweight and customizable bottom navigation bar.
class BottomNavX extends StatefulWidget {
  /// The items to display in the navigation bar.
  final List<BottomNavItem> items;

  /// The controller for the navigation bar.
  final BottomNavController controller;

  /// A builder for the pages.
  final Widget Function(int index) pageBuilder;

  /// A builder for the tab items.
  final Widget Function(int index, bool isSelected)? tabBuilder;

  /// The callback that is called when a tab is tapped.
  final ValueChanged<int>? onTap;

  /// Creates a new instance of [BottomNavX].
  const BottomNavX({
    Key? key,
    required this.items,
    required this.controller,
    required this.pageBuilder,
    this.tabBuilder,
    this.onTap,
  }) : super(key: key);

  @override
  _BottomNavXState createState() => _BottomNavXState();
}

class _BottomNavXState extends State<BottomNavX> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onIndexChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onIndexChanged);
    super.dispose();
  }

  void _onIndexChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.controller.index,
        children: List.generate(widget.items.length, (index) {
          return widget.pageBuilder(index);
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: widget.items.map((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.title,
            activeIcon: item.activeIcon,
          );
        }).toList(),
        currentIndex: widget.controller.index,
        onTap: (index) {
          widget.controller.index = index;
          widget.onTap?.call(index);
        },
      ),
    );
  }
}
