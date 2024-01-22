import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/i_cart_item.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ICartItems extends StatelessWidget {
  const ICartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) =>
            const SizedBox(height: ISizes.spaceBtwSections),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                const ICartItem(),
                if (showAddRemoveButton)
                  const SizedBox(height: ISizes.spaceBtwItems),
                if (showAddRemoveButton)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          IProductQuantityWithAddRemove(),
                        ],
                      ),
                      IProductPriceText(price: '120.00'),
                    ],
                  )
              ],
            ));
  }
}
