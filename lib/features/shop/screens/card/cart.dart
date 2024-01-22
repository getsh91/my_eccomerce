import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/card/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
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
            onPressed: () {
              Get.to(const CheckoutScreen());
            },
            child: const Text('Checkout \$120.00')),
      ),
      body: const Padding(
          padding: EdgeInsets.all(ISizes.defaultSpace), child: ICartItems()),
    );
  }
}
