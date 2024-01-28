import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup_page.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/validators/validation.dart';

class ILoginForm extends StatelessWidget {
  const ILoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.only(top: ISizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                  controller: controller.email,
                  validator: (value) => IValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    hintText: ITexts.email,
                  )),
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
              const SizedBox(height: ISizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          })),
                      const Text(ITexts.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPassword());
                      },
                      child: const Text(ITexts.forgetPassword)),
                ],
              ),
              const SizedBox(height: ISizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.emailAndPasswordLogin();
                    },
                    child: const Text(ITexts.signIn)),
              ),
              const SizedBox(height: ISizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const SignupPage());
                    },
                    child: const Text(ITexts.createAccount)),
              ),
              const SizedBox(height: ISizes.spaceBtwSections),
            ],
          ),
        ));
  }
}
