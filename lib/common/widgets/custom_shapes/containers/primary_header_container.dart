import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/corved_edges/corved_edge_widget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'circular_container.dart';

class IPrimaryHeaderContainer extends StatelessWidget {
  const IPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ICurvedEdgeWidget(
      child: Container(
        color: IColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: ICircularContainer(
                  background: IColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ICircularContainer(
                  background: IColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
