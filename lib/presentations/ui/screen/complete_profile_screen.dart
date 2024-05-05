import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shoppingAddressTEController = TextEditingController();

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
                  const SizedBox(height: 30,),
                  const AppLogo(),
                  const SizedBox(height: 24,),
                  Text('Complete Profile',style: textTheme.titleLarge,),
                  const SizedBox(height: 4,),
                  Text('Get started with us with your details',style: textTheme.displaySmall,),
                  const SizedBox(height: 24,),
                  TextFormField(
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(
                        hintText: 'First Name'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(
                        hintText: 'Last Name'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Mobile'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _cityTEController,
                    decoration: const InputDecoration(
                        hintText: 'City'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _shoppingAddressTEController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Shopping Address'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){}, child: const Text('Complete'))
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
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shoppingAddressTEController.dispose();
    super.dispose();
  }
}
