import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/corved_edges/corved_edges.dart';

class ICurvedEdgeWidget extends StatelessWidget {
  const ICurvedEdgeWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ICustomCurvedEdges(),
      child: child,
    );
  }
}
