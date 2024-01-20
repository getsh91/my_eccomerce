import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class IUserProfileTile extends StatelessWidget {
  const IUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ICircularImage(
        image: IImages.user,
        width: 50,
        height: 50,
        padding: 0,
        fit: BoxFit.contain,
      ),
      title: Text('Isaac',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: IColors.white)),
      subtitle: Text('isaac@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: IColors.white)),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.edit),
          color: IColors.white),
    );
  }
}
