import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/utils/validators.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';
import 'package:sooqy/features/auth/presentation/widgets/header_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
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
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).pushNamed(Routes.forgetPassword),
                      child: Text(
                        'Forget password?',
                        style: getSemiBoldStyle(color: ColorManager.green),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      UIUtils.showLoading(context);
                    } else if (state is LoginSuccess) {
                      UIUtils.hideLoading(context);
                      Navigator.of(context).pushReplacementNamed(Routes.home);
                    } else if (state is LoginError) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.message);
                    }
                  },
                  child: CustomElevatedButton(
                    innerPadding: const EdgeInsets.all(16),
                    label: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          LoginRequest(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
                    isStadiumBorder: false,
                    radius: 16,
                    backgroundColor: ColorManager.green,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: getSemiBoldStyle(color: ColorManager.gradiant1),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.register),
                      child: Text(
                        'Create Account',
                        style: getSemiBoldStyle(color: ColorManager.green),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorManager.gradiant1,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorManager.gradiant1,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Login with Google',
                  textStyle: getSemiBoldStyle(
                    color: ColorManager.black,
                    fontSize: 16,
                  ),
                  onTap: () {},
                  backgroundColor: ColorManager.backgroundColor,
                  radius: 16,
                  isStadiumBorder: false,
                  prefixIcon: SvgPicture.asset(IconsAssets.google),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
