import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/validators.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/auth/presentation/widgets/header_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Screen')),
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
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _fNameController,
                  hint: 'First Name',
                  backgroundColor: ColorManager.backgroundColor,
                  validation: Validator.validateUsername,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _lNameController,
                  hint: 'Last Name',
                  backgroundColor: ColorManager.backgroundColor,
                  validation: Validator.validateUsername,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _emailController,
                  hint: 'Enter your email',
                  backgroundColor: ColorManager.backgroundColor,
                  validation: Validator.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _passwordController,
                  hint: 'Enter your password',
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
                  label: 'Register',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // context.read<AuthCubit>().register(
                      //   RegisterRequest(
                      //     firstName: _fNameController.text,
                      //     lastName: _lNameController.text,
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   ),
                      // );
                    }
                  },
                  isStadiumBorder: false,
                  radius: 16,
                  backgroundColor: ColorManager.green,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: getSemiBoldStyle(color: ColorManager.gradiant1),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.login),
                      child: Text(
                        'Login',
                        style: getSemiBoldStyle(color: ColorManager.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
