import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ISizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    const ICircularImage(
                        image: IImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ])),
              const SizedBox(height: ISizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ISizes.spaceBtwItems),
              const ISectionHeading(
                  showActionButton: false, title: 'Profile Information'),
              const SizedBox(height: ISizes.spaceBtwItems),
              IProfileMenu(
                title: 'Name',
                value: 'isu e',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              IProfileMenu(
                title: 'UserName',
                value: 'isu',
                onPressed: () {},
              ),
              const SizedBox(height: ISizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ISizes.spaceBtwItems),
              const ISectionHeading(
                  showActionButton: false, title: 'Personal Information'),
              const SizedBox(height: ISizes.spaceBtwItems),
              IProfileMenu(
                title: 'User_Id',
                value: '3677',
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'E-mail',
                value: 'isu@mail.com',
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'Phone Number',
                value: '+1234567890',
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'Date of Birth',
                value: '25 Sep, 2000',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: ISizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
