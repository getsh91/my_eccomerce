import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      IValidator.validateEmptyText('firstName', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ITexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
                const SizedBox(width: ISizes.spaceBtwInputFields),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      IValidator.validateEmptyText('lastName', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ITexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ))
              ],
            ),
            const SizedBox(height: ISizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  IValidator.validateEmptyText('userName', value),
              decoration: const InputDecoration(
                  labelText: ITexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: ISizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.email,
              validator: (value) => IValidator.validateEmail(value),
              decoration: const InputDecoration(
                  labelText: ITexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: ISizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => IValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                  labelText: ITexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: ISizes.spaceBtwInputFields),
            Obx(() => TextFormField(
                  controller: controller.password,
                  validator: (value) => IValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: ITexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      )),
                )),
            const SizedBox(height: ISizes.spaceBtwInputFields),
            const TermsAndConditionCheckbox(),
            const SizedBox(height: ISizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signUp();
                },
                child: const Text(ITexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
