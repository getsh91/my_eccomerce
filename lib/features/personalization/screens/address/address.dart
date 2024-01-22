import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNewAddressScreen());
        },
        backgroundColor: IColors.primary,
        child: const Icon(Iconsax.add, color: IColors.white),
      ),
      appBar: IAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(ISizes.defaultSpace),
              child: Column(children: [
                ISingleAddress(selectAddress: true),
                ISingleAddress(selectAddress: false),
              ])),
        ],
      )),
    );
  }
}
