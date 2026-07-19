import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/utils/validators.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/auth/presentation/widgets/header_section.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16),
                const HeaderSection(),
                const SizedBox(height: 32),
                Text(
                  "Create a new password to log in to your account.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _passwordController,
                  hint: 'Enter New password',
                  backgroundColor: ColorManager.backgroundColor,
                  isObscured: true,
                  validation: Validator.validatePassword,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _rePasswordController,
                  hint: 'Confirm your password',
                  backgroundColor: ColorManager.backgroundColor,
                  isObscured: true,
                  validation: (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Confirm ',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  isStadiumBorder: false,
                  radius: 16,
                  backgroundColor: ColorManager.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
