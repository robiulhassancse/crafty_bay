import 'package:crafty_bay/app.dart';
import 'package:crafty_bay/data/model/create_profile/create_profile.dart';
import 'package:crafty_bay/presentations/state_holder/create_profile_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  // final TextEditingController _firstNameTEController = TextEditingController();
  // final TextEditingController _lastNameTEController = TextEditingController();
  // final TextEditingController _mobileTEController = TextEditingController();
  // final TextEditingController _cityTEController = TextEditingController();
  // final TextEditingController _shoppingAddressTEController = TextEditingController();
  //
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityTEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
      TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusMobileTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
      TextEditingController();
  final TextEditingController _shipCountryTEController =
      TextEditingController();
  final TextEditingController _shipMobileTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const AppLogo(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Complete Profile',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Get started with us with your details',
                    style: textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _cusNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Full Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _cusAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Your Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cusPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _cusMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _cusFaxTEController,
                    decoration: const InputDecoration(
                      hintText: '356******',
                      labelText: 'Fax',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your fax number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Shipping Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _shipNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Shipping Person Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping person full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _shipAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'Shipping City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'Shipping State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _shipPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Shipping Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Shipping Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _shipMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Shipping Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateProfileController>(
                        builder: (createProfileController) {
                      if (createProfileController.createProfileInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ProfileData profileData = ProfileData(
                              cusName: _cusNameTEController.text,
                              cusAdd: _cusAddTEController.text,
                              cusCity: _cusCityTEController.text,
                              cusState: _cusStateTEController.text,

                              cusCountry: _cusCountryTEController.text,
                              cusFax: _cusFaxTEController.text,
                              cusPhone: _cusPostcodeTEController.text,
                              cusPostcode: _cusPostcodeTEController.text,
                              shipAdd: _shipAddTEController.text,
                              shipCity: _shipCityTEController.text,
                              shipCountry: _shipCountryTEController.text,
                              shipName: _shipNameTEController.text,
                              shipPhone: _shipMobileTEController.text,
                              shipPostcode: _shipPostcodeTEController.text,
                              shipState: _shipStateTEController.text,
                              updatedAt: DateTime.now().toString(),
                              createdAt: DateTime.now().toString(),

                            );

                            bool isSuccess = await createProfileController
                                .createProfile(profileData);

                            if (isSuccess) {
                              Get.snackbar(
                                  'Success', 'Profile create successful.',
                                  backgroundColor: AppColors.primaryColor,
                                  // colorText: AppColors.foregroundColor,
                                  borderRadius: 10,
                                  snackPosition: SnackPosition.BOTTOM);
                              Get.offAll(() => const MainBottomNavBarScreen());
                            } else {
                              Get.snackbar(
                                  'Failed', 'Profile create failed! Try again.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  borderRadius: 10,
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          }
                        },
                        child: const Text('Complete'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cusNameTEController.dispose();
    _cusAddTEController.dispose();
    _cusCityTEController.dispose();
    _cusStateTEController.dispose();
    _cusPostcodeTEController.dispose();
    _cusCountryTEController.dispose();
    _cusMobileTEController.dispose();
    _cusFaxTEController.dispose();
    _shipNameTEController.dispose();
    _shipAddTEController.dispose();
    _shipCityTEController.dispose();
    _shipStateTEController.dispose();
    _shipPostcodeTEController.dispose();
    _shipCountryTEController.dispose();
    _shipMobileTEController.dispose();
    super.dispose();
  }
}
