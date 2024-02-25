import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:ecommers_app2/core/constants/strings.dart';
import 'package:ecommers_app2/core/platform/helper_functions.dart';
import 'package:ecommers_app2/presentation/widgets/user/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? TColors.darkPrimary : TColors.lightPrimary,
      appBar: AppBar(
        title: const Text(TTexts.userPageTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              const Hero(
                tag: "C001",
                child: CircleAvatar(
                    radius: 75.0,
                    //  backgroundColor: Colors.grey.shade200,
                    child: Icon(Iconsax.user)),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const InputTextFormField(
                hint: TTexts.inputFieldTintFirstName,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const InputTextFormField(
                hint: TTexts.inputFieldTintLastName,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const InputTextFormField(
                enable: false,
                hint: TTexts.inputFieldTintEmail,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      TTexts.submitButton,
                      style: TextStyle(color: TColors.textLight),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
