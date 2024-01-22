import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const IAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ISizes.spaceBtwInputFields),
          child: Form(
            child: Column(children: [
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Full Name', prefixIcon: Icon(Iconsax.user))),
              const SizedBox(height: ISizes.spaceBtwInputFields),
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.mobile))),
              const SizedBox(height: ISizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Street',
                            prefixIcon: Icon(Iconsax.building_31))),
                  ),
                  const SizedBox(width: ISizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Postal Code',
                            prefixIcon: Icon(Iconsax.code))),
                  ),
                ],
              ),
              const SizedBox(height: ISizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'City',
                            prefixIcon: Icon(Iconsax.building))),
                  ),
                  const SizedBox(width: ISizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'State',
                            prefixIcon: Icon(Iconsax.activity))),
                  ),
                ],
              ),
              const SizedBox(height: ISizes.spaceBtwInputFields),
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Country', prefixIcon: Icon(Iconsax.global))),
              const SizedBox(height: ISizes.spaceBtwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save Address'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
