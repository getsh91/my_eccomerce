import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class IGridLayout extends StatelessWidget {
  const IGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            crossAxisSpacing: ISizes.gridViewSpacing,
            mainAxisSpacing: ISizes.gridViewSpacing),
        itemBuilder: itemBuilder);
  }
}
