import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(ISizes.defaultSpace),
        child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: IValidator.validateEmail,
                  decoration: const InputDecoration(
                      labelText: ITexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(height: ISizes.spaceBtwInputFields),
                Obx(() => TextFormField(
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          IValidator.validateEmptyText('Password', value),
                      obscureText: controller.hidePassword.value,
                      decoration: const InputDecoration(
                          labelText: ITexts.password,
                          prefixIcon: Icon(Iconsax.lock)),
                    )),
                const SizedBox(height: ISizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.reAuthenticateEmailAndPaswordUser();
                    },
                    child: const Text('Verify'),
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
