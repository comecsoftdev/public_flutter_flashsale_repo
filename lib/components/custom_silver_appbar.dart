import 'package:flutter/material.dart';

// CustomSliverAppBarDelegate for SliverPersistentHeader
// https://api.flutter.dev/flutter/widgets/SliverPersistentHeaderDelegate-class.html
class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget customWidget;

  CustomSliverAppBarDelegate({required this.maxHeight, required this.minHeight, required this.customWidget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Add shrinking and growing effect later if necessary
    return Stack(
      fit: StackFit.expand,
      children: [
        customWidget,
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}