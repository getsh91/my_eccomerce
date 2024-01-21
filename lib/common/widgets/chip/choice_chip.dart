import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IChoiceChip extends StatelessWidget {
  const IChoiceChip(
      {super.key,
      required this.text,
      required this.isSelected,
      this.onSelected});

  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = IHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: isSelected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: isSelected ? IColors.white : null),
      avatar: isColor
          ? ICircularContainer(
              width: 24,
              height: 24,
              background: IHelperFunctions.getColor(text)!)
          : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      backgroundColor: isColor ? IHelperFunctions.getColor(text)! : null,
    );
  }
}
