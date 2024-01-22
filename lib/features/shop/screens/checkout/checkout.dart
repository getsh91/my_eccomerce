import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/bottom_navigation.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/card/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: IAppBar(
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(ISizes.defaultSpace),
              child: Column(
                children: [
                  Container(
                      height: 300,
                      child: const ICartItems(showAddRemoveButton: false)),
                  const SizedBox(height: ISizes.spaceBtwSections),
                  const ICouponCode(),
                  const SizedBox(height: ISizes.spaceBtwSections),
                  IRoundedContainer(
                    showBorder: true,
                    backgroundColor: dark ? IColors.black : IColors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(ISizes.defaultSpace),
                      child: Column(
                        children: [
                          IBillingAmountSection(),
                          SizedBox(height: ISizes.spaceBtwItems),
                          Divider(),
                          SizedBox(height: ISizes.spaceBtwItems),
                          IBillingPaymentSection(),
                          SizedBox(height: ISizes.spaceBtwItems),
                          IBillingAddressSection(),
                        ],
                      ),
                    ),
                  )
                ],
              ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ISizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(SuccessScreen(
                image: IImages.successfulPaymentIcon,
                title: 'Payment Success',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () {
                  Get.offAll(const BottomNavigation());
                }));
          },
          child: const Text('Checkout \$200.0'),
        ),
      ),
    );
  }
}
