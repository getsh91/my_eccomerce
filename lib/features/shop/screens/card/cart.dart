import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cards/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cards/cart_items.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ISizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$120.00')),
      ),
      body: Padding(
          padding: const EdgeInsets.all(ISizes.defaultSpace),
          child: ListView.separated(
              separatorBuilder: (_, __) =>
                  const SizedBox(height: ISizes.spaceBtwSections),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (_, index) => const Column(
                    children: [
                      ICartItems(),
                      SizedBox(height: ISizes.spaceBtwItems),
                      Row(
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
                  ))),
    );
  }
}
