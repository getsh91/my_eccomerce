import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/common/widgets/shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : IImages.user;
                      return controller.imageUploading.value
                          ? const IShimmerEffect(
                              height: 80, width: 80, radius: 80)
                          : ICircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetwokImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadProfileImage();
                        },
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
                  value: controller.user.value.fullName,
                  onPressed: () {
                    Get.to(const ChangeName());
                  }),
              IProfileMenu(
                title: 'UserName',
                value: controller.user.value.userName,
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
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              IProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
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
                  onPressed: () {
                    controller.deleteAccountWarningPopup();
                  },
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
