import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_ties/setting_menu_tile.dart';
import 'package:t_store/common/widgets/list_ties/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = IHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          IPrimaryHeaderContainer(
              child: Column(
            children: [
              IAppBar(
                title: Text('Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: IColors.white)),
              ),
              IUserProfileTile(onPressed: () {
                Get.to(const ProfileScreen());
              }),
              const SizedBox(height: ISizes.spaceBtwSections),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(ISizes.defaultSpace),
            child: Column(children: [
              const ISectionHeading(
                  title: 'Account Settings', showActionButton: false),
              const SizedBox(height: ISizes.spaceBtwItems),
              ISettingMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subtitle: 'Set shopping delivery address',
                  onTap: () {
                    Get.to(const AddressScreen());
                  }),
              ISettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove product and move to checkout',
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Order',
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () {
                    Get.to(const OrderScreen());
                  }),
              ISettingMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to registerd bank account',
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subtitle: 'List of all the discounted coupons',
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notification',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connected accounts',
                  onTap: () {}),
              const SizedBox(height: ISizes.spaceBtwSections),
              const ISectionHeading(
                  title: 'App Settings', showActionButton: false),
              const SizedBox(height: ISizes.spaceBtwItems),
              ISettingMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Load Data',
                  subtitle: 'Upload data to your cloud firbase',
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subtitle: 'Set reccommendation based on your location',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subtitle: 'Search result is safe for all ages',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {}),
              ISettingMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subtitle: 'Set image quality to be seen',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: () {}),
              const Divider(),
              TextButton(
                  onPressed: () {
                    controller.logout();
                  },
                  child: Text('Logout',
                      style: TextStyle(
                          fontSize: ISizes.fontSizeMd,
                          color: dark ? IColors.primary : IColors.black)))
            ]),
          )
        ],
      )),
    );
  }
}
