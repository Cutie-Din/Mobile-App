import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify.dart';

class AppSignUpForm extends StatelessWidget {
  const AppSignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AppTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AppTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: AppTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          /// Terms&Conditions Checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {}),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${AppTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '${AppTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? AppColors.white : AppColors.black,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.black,
                            ),
                      ),
                      TextSpan(
                        text: '${AppTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: AppTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? AppColors.white : AppColors.black,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          /// Sign up
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyScreen()),
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
