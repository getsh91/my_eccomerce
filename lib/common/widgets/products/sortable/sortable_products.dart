import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ISortableProducts extends StatelessWidget {
  const ISortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownButtonFormField(
        onChanged: (value) {},
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        items: [
          'Name',
          'Higher Price',
          'Lower Price',
          'Sale',
          'Newest',
          'Popularity'
        ]
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
      ),
      const SizedBox(height: ISizes.spaceBtwSections),
      IGridLayout(
          itemCount: 8, itemBuilder: (_, index) => const IProductCardVertical())
    ]);
  }
}
