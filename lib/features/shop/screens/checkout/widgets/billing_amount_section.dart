import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class IBillingAmountSection extends StatelessWidget {
  const IBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$120.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ISizes.spaceBtwItems / 2),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$5.0', style: Theme.of(context).textTheme.labelLarge),
        ]),
        const SizedBox(height: ISizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$3.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ISizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$128.00', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
