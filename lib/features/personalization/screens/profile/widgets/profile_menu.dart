import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IProfileMenu extends StatelessWidget {
  const IProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
  });
  final String title, value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis)),
          Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis)),
          Expanded(
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    size: 18,
                  )))
        ],
      ),
    );
  }
}
